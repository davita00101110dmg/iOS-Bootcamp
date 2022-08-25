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

        makeFavoriteButtonOutlet.setTitle(note!.isFavorite ? "Make unfavorite" : "Make favorite", for: .normal)
        makeFavoriteButtonOutlet.clipsToBounds = false
        makeFavoriteButtonOutlet.layer.cornerRadius = 15
        makeFavoriteButtonOutlet.setTitleColor(UIColor.systemPink, for: .normal)
        
        saveChangesButtonOutlet.setTitle("Save", for: .normal)
        saveChangesButtonOutlet.clipsToBounds = false
        saveChangesButtonOutlet.layer.cornerRadius = 15
        saveChangesButtonOutlet.setTitleColor(UIColor.systemYellow, for: .normal)
    }
    
    @IBAction func makeFavoriteButtonAction(_ sender: Any) {
        note?.isFavorite.toggle()
        
        makeFavoriteButtonOutlet.setTitle(note!.isFavorite ? "Make unfavorite" : "Make favorite", for: .normal)
        
        
        do {
            try context.save()
        } catch {
            //FIXME: handle error
            print(error.localizedDescription)
        }
    }
    
    @IBAction func saveChangesButtonAction(_ sender: Any) {
        note?.content = editNoteTextView.text
        
        do {
            try context.save()
        } catch {
            //FIXME: handle error
            print(error.localizedDescription)
        }
    }
    

}
