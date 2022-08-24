//
//  ViewController.swift
//  DavitiKhvedelidzeHW25
//
//  Created by Dato Khvedelidze on 23.08.22.
//

import UIKit

class DirectoriesViewController: UIViewController {
    
    @IBOutlet weak var directoriesTableView: UITableView!
    
    let fileManager = FileManagerHelper.shared
    
    // Initializing empty array to later fill with already created directories if they exist, if not, append directories which user will create
    var directories: [String] = [] {
        didSet {
            directoriesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        loadCategories()
    }
    
    private func setupUI() {
        title = "Categories"
        view.backgroundColor = UIColor.lightGray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addCategoryAction))
    }
    
    
    private func setupTableView() {
        directoriesTableView.delegate = self
        directoriesTableView.dataSource = self
        directoriesTableView.register(UINib(nibName: "DirectoryCell", bundle: nil), forCellReuseIdentifier: "DirectoryCell")
    }
    
    private func loadCategories() {
        let result = fileManager.loadDirectories()
        
        switch result {
            
        case .success(let directories):
            self.directories = directories
        case .failure(let error):
            print(error)
        }
    }
    
    @objc func addCategoryAction() {
        let alert = UIAlertController(title: "Add new category",
                                      message: "Enter the name of the category",
                                      preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Category"
        }
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { _ in
            
            guard let categoryField = alert.textFields else { return }
            
            guard let category = categoryField.first!.text, !category.isEmpty, !self.directories.contains(category) else { print("Emptry field or already created category"); return }
            
            self.fileManager.addDirectory(named: category)
            self.directories.append(category)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
}

extension DirectoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        directories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DirectoryCell", for: indexPath) as? DirectoryCell else { return UITableViewCell() }
        
        let currentDirectory = directories[indexPath.row]
        cell.directoryNameLabel.text = currentDirectory
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let remindersVC = storyboard?.instantiateViewController(withIdentifier: "RemindersViewController") as? RemindersViewController else { return }
        
        let selectedDirectory = directories[indexPath.row]
        remindersVC.currentDirectory = selectedDirectory
        
        self.navigationController?.pushViewController(remindersVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let path = directories[indexPath.row]
            fileManager.deleteDirectory(at: path)
            self.directories.remove(at: indexPath.row)
        }
    }
    
    
}
