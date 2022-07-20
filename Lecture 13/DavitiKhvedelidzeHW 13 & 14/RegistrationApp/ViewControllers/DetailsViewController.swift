//
//  DetailsViewController.swift
//  RegistrationApp
//
//  Created by Dato Khvedelidze on 09.07.22.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var usernameDisplay: UILabel!
    @IBOutlet weak var emailDisplay: UILabel!
    @IBOutlet weak var thirdField: UILabel!
    @IBOutlet weak var fourthField: UILabel!
    
    var username: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameDisplay.text = "Username: \(username ?? "")"
        emailDisplay.text = "Email: \(email ?? "")"

    }
    
    @IBAction func signOutButton(_ sender: Any) {
        let bottomSheet = BottomSheetViewController(nibName: "BottomSheetView", bundle: nil)

        bottomSheet.sheetPresentationController?.detents = [.medium()]
        bottomSheet.sheetPresentationController?.preferredCornerRadius = 40
        bottomSheet.sheetPresentationController?.prefersGrabberVisible = true
        present(bottomSheet, animated: true)
        
    }
    
}
