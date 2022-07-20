//
//  RegistrationPageViewController.swift
//  RegistrationApp
//
//  Created by Dato Khvedelidze on 09.07.22.
//

import UIKit

protocol DataPassing {
    func data(username: String, password: String, email: String)
}

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var usernameError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var confirmPasswordError: UILabel!
    
    var delegate: DataPassing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func signUpButton(_ sender: Any) {
        if usernameField.text != "" && emailField.text != "" && passwordField.text != "" && confirmPasswordField.text != "" && passwordField.text == confirmPasswordField.text && passwordField.text?.count ?? 0 > 8 {
            delegate?.data(username: usernameField.text!, password: passwordField.text!, email: emailField.text!)
            self.navigationController?.popViewController(animated: true)
        }
        if usernameField.text == "" {
            usernameError.text = "Enter a username"
        } else {
            usernameError.text = ""
        }
        if emailField.text == "" {
            emailError.text = "Enter an email"
        } else {
            emailError.text = ""
        }
        if passwordField.text?.count ?? 0 < 8 {
            passwordError.text = "Password should be at least 8 characters"
        } else {
            passwordError.text = ""
        }
        if confirmPasswordField.text == "" || passwordField.text != confirmPasswordField.text {
            let alertController = UIAlertController(title: "Passwords doesn't match", message: "Please enter valid password", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(alertController, animated: true)
        }
    }
}




