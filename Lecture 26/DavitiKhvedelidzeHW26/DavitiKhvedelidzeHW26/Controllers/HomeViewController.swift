//
//  ViewController.swift
//  DavitiKhvedelidzeHW26
//
//  Created by Dato Khvedelidze on 25.08.22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var notesTableView: UITableView!
    
    // Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
    var items: [Note]? {
        didSet {
            DispatchQueue.main.async {
                self.notesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNotes(onlyFavorites: false)
        setupUI()
        setupTableView()
        
    }
    
    private func fetchNotes(onlyFavorites: Bool) {
        
        let request = Note.fetchRequest()
        
        // Filtering data if user choose only favorite notes
        if onlyFavorites {
            
            let CustomPredicate = NSPredicate(format: "isFavorite == true")
            
            request.predicate = CustomPredicate
            
        }
        
        // Fetch data from core data
        do {
            self.items = try context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupUI() {
        title = "Notes"
        navigationController?.navigationBar.tintColor = UIColor.systemYellow
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addNote))
    }
    
    private func setupTableView() {
        notesTableView.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    @objc func addNote() {
        
        let alert = UIAlertController(title: "Add new note",
                                      message: "Write your text here",
                                      preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.placeholder = "Name"
        }
        
        alert.addTextField { textfield in
            textfield.placeholder = "Content"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Submit",
                                      style: .default,
                                      handler: { _ in
            
            guard let fields = alert.textFields else { return }
            
            guard let name = fields[0].text, !name.isEmpty else { return }
            guard let content = fields[1].text else { return }
            
            // Create note object
            let newNote = Note(context: self.context)
            newNote.name = name
            newNote.content = content
            newNote.isFavorite = false
            
            // Save the data
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            // Refresh the data
            self.fetchNotes(onlyFavorites: false)
        }))
        
        present(alert, animated: true)
        
    }
    

    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        
        // Fetching data depending on the user selection
        if sender.selectedSegmentIndex == 0 {
            fetchNotes(onlyFavorites: false)
        } else {
            fetchNotes(onlyFavorites: true)
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as? NoteCell else { return UITableViewCell() }
    
        let currentNote = items![indexPath.row]
        
        cell.noteNameLabel.text = currentNote.name!

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create delete action
        let action = UIContextualAction(style: .destructive,
                                        title: "Delete") { action, view, completionHandler in
            
            // Which note to remove
            let noteToRemove = self.items![indexPath.row]
            
            // Remove from core data
            self.context.delete(noteToRemove)
            
            // Save the data
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            // Re-fetch the data
            self.fetchNotes(onlyFavorites: false)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        
        let currentNote = self.items![indexPath.row]
        
        // Pass current note
        detailsVC.note = currentNote
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
