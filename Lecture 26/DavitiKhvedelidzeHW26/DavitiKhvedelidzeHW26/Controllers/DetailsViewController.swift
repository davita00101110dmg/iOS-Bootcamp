//
//  DetailsViewController.swift
//  DavitiKhvedelidzeHW26
//
//  Created by Dato Khvedelidze on 25.08.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var editNoteTextView: UITextView!
    @IBOutlet weak var makeFavoriteButtonOutlet: UIButton!
    @IBOutlet weak var saveChangesButtonOutlet: UIButton!
    
    // Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Current note
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        editNoteTextView.isEditable = true
        editNoteTextView.text = note?.content
        editNoteTextView.font = UIFont(name: "Futura", size: 20)

        setupButton(for: makeFavoriteButtonOutlet, with: note!.isFavorite ? "Make unfavorite" : "Make favorite", color: UIColor.systemPink)
        setupButton(for: saveChangesButtonOutlet, with: "Save", color: UIColor.systemYellow)
    }
    
    private func setupButton(for button: UIButton, with title: String, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 15
        button.setTitleColor(color, for: .normal)
        button.tintColor = color
    }
    
    @IBAction func makeFavoriteButtonAction(_ sender: Any) {
        // Toggle value of propertie isFavorite after click on the button
        note?.isFavorite.toggle()
        
        // Change title of button
        makeFavoriteButtonOutlet.setTitle(note!.isFavorite ? "Make unfavorite" : "Make favorite", for: .normal)
        
        // Save the data
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func saveChangesButtonAction(_ sender: Any) {
        
        // Change the content of the note
        note?.content = editNoteTextView.text
        
        // Save the data
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    

}
