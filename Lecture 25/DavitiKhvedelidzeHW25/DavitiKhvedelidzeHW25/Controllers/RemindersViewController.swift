//
//  RemindersViewController.swift
//  DavitiKhvedelidzeHW25
//
//  Created by Dato Khvedelidze on 23.08.22.
//

import UIKit

class RemindersViewController: UIViewController {
    
    @IBOutlet weak var remindersTableView: UITableView!
    
    let fileManager = FileManagerHelper.shared
    
    // Initializing empty dictionary to later fill with already created reminders if they exist, if not, append reminders which user will create
    var reminders: [String: String] = [:] {
        didSet {
            remindersTableView.reloadData()
        }
    }
    
    var currentDirectory = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        loadReminders()
    }
    
    private func setupUI() {
        title = currentDirectory
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addReminderAction))
    }
    
    
    private func setupTableView() {
        remindersTableView.delegate = self
        remindersTableView.dataSource = self
        remindersTableView.register(UINib(nibName: "ReminderCell", bundle: nil), forCellReuseIdentifier: "ReminderCell")
    }
    
    private func loadReminders() {
        let result = fileManager.loadReminders(currentDirectory: currentDirectory)

        
        switch result {
        case .success(let reminders):
            self.reminders = reminders
        case .failure(let error):
            print(error)
        }
    }
    
    @objc func addReminderAction() {
        let alert = UIAlertController(title: "Add new reminder",
                                      message: "Enter title and body of the reminder",
                                      preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Name of the reminder"
        }
        
        alert.addTextField { field in
            field.placeholder = "Details of the reminder"
        }
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { _ in
            
            guard let reminderFields = alert.textFields else { return }
            
            guard let reminderName = reminderFields[0].text, !reminderName.isEmpty else { print("Emptry field"); return }
            guard let reminderDetails = reminderFields[1].text, !reminderDetails.isEmpty else { print("Emptry field"); return }

            self.fileManager.addReminderFile(currentDirectory: self.currentDirectory, named: reminderName, data: reminderDetails)
            self.reminders[reminderName] = reminderDetails
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
}

extension RemindersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as? ReminderCell else { return UITableViewCell() }
        
        let currentReminder = reminders[indexPath.row]
        cell.reminderNameLabel.text = currentReminder.key
        cell.reminderDetailsLabel.text = currentReminder.value
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentReminder = reminders[indexPath.row]
        
        let alert = UIAlertController(title: "Edit reminder",
                                      message: currentReminder.key,
                                      preferredStyle: .alert)
            
        alert.addTextField(configurationHandler: { field in
            field.placeholder = "New reminder"
        })
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { _ in
            
            guard let reminderFields = alert.textFields else { return }
            
            guard let newReminder = reminderFields.first!.text, !newReminder.isEmpty else { print("Empty field "); return }
                
            self.reminders[currentReminder.key] = newReminder
            self.fileManager.addReminderFile(currentDirectory: self.currentDirectory, named: currentReminder.key, data: newReminder)
        }))
        
        present(alert, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let path = "/" + reminders[indexPath.row].key
            fileManager.deleteReminder(currentDirectory: currentDirectory, at: path)
            self.reminders.removeValue(forKey: reminders[indexPath.row].key)
        }
    }
    
}

extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        return self[index(startIndex, offsetBy: i)]
    }
}
