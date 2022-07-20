//
//  ViewController.swift
//  RegistrationApp
//
//  Created by Dato Khvedelidze on 05.07.22.
//

import UIKit


class LogInViewController: UIViewController, DataPassing {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    var username: String?
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .label

        
    }
    
    func data(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if usernameField.text == username && passwordField.text == password {
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            detailsVC.username = username
            detailsVC.email = email
            self.navigationController?.pushViewController(detailsVC, animated: true)
            usernameField.text = ""
            passwordField.text = ""
        } else {
            let alertController = UIAlertController(title: "Incorrect Credentials", message: "Please enter valid username and password", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(alertController, animated: true)
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registrationVC = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        registrationVC.delegate = self
        self.navigationController?.pushViewController(registrationVC, animated: true)
    }
    
}
