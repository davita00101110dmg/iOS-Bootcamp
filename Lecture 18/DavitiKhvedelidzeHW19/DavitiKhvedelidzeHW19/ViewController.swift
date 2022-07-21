//
//  ViewController.swift
//  DavitiKhvedelidzeHW19
//
//  Created by Dato Khvedelidze on 21.07.22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var footerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTitleLbl()
        setupImgView()
        setupLoginField()
        setupPasswordField()
        setupSignInBtn()
        setupFooterLbl()
    }

    func setupView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let purple = UIColor(red: 161/255, green: 92/255, blue: 216/255, alpha: 1).cgColor
        let blue = UIColor(red: 46/255, green: 123/255, blue: 246/255, alpha: 1).cgColor
        
        gradient.colors = [purple, blue]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setupTitleLbl() {
        titleLbl.text = "iOS App Templates"
        titleLbl.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        titleLbl.textAlignment = .center
        titleLbl.textColor = .white
        titleLbl.numberOfLines = 0
        
        titleLbl.layer.shadowColor = UIColor.black.cgColor
        titleLbl.layer.shadowRadius = 12.0
        titleLbl.layer.shadowOpacity = 0.5
        titleLbl.layer.shadowOffset = CGSize(width: 20, height: 10)
        titleLbl.layer.masksToBounds = false
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let topConstraint = NSLayoutConstraint(item: titleLbl!, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 40)
        
        let width = NSLayoutConstraint(item: titleLbl!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 300)
        
        NSLayoutConstraint.activate([
            topConstraint,
            width
        ])
    }
    
    func setupImgView() {
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        
        let flag = screenHeight > 667
        
        var imgSize: CGFloat
        
        if flag {
            imgSize = 275.0
        } else {
            imgSize = 200.0
        }
        
        imgView.image = UIImage(named: "icon")
        imgView.frame = CGRect(x: screenWidth / 2 - 100, y: screenWidth / 2, width: imgSize, height: imgSize)
        imgView.layer.cornerRadius = imgSize / 2
        imgView.layer.borderWidth = 5
        imgView.layer.borderColor = UIColor.white.cgColor
        
        imgView.layer.shadowColor = UIColor.black.cgColor
        imgView.layer.shadowRadius = 12.0
        imgView.layer.shadowOpacity = 0.3
        imgView.layer.shadowOffset = CGSize(width: 20, height: 20)
        imgView.layer.masksToBounds = false
        
        imgView.contentMode = .scaleAspectFill
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let topConstraint = NSLayoutConstraint(item: imgView!, attribute: .top, relatedBy: .equal, toItem: titleLbl, attribute: .bottom, multiplier: 1, constant: 75)
        
        let width = NSLayoutConstraint(item: imgView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: imgSize)
        
        let height = NSLayoutConstraint(item: imgView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: imgSize)
        
        NSLayoutConstraint.activate([
            topConstraint,
            width,
            height
        ])
    }
    
    func setupLoginField() {
        let screenHeight = view.frame.height
        let flag = screenHeight > 667
        
        var fieldHeight: CGFloat
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginField.frame.height))
        
        if flag {
            fieldHeight = 60
        } else {
            fieldHeight = 40
        }
        
        loginField.layer.cornerRadius = flag ? 23 : 13
        loginField.placeholder = "Email"
        loginField.font = UIFont(name: "Futura", size: 17)
        loginField.leftView = leftPaddingView
        loginField.leftViewMode = .always
        loginField.layer.masksToBounds = true
        loginField.translatesAutoresizingMaskIntoConstraints = false
        loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let height = NSLayoutConstraint(item: loginField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: fieldHeight)
        
        let topConstraint = NSLayoutConstraint(item: loginField!, attribute: .top, relatedBy: .equal, toItem: imgView, attribute: .bottom, multiplier: 1, constant: 50)
        
        let leftConstraint = NSLayoutConstraint(item: loginField!, attribute: .left, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .left, multiplier: 1, constant: 15)

        NSLayoutConstraint.activate([
            height,
            topConstraint,
            leftConstraint
        ])
    }
    
    func setupPasswordField() {
        let screenHeight = view.frame.height
        let flag = screenHeight > 667
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordField.frame.height))
        
        var fieldHeight: CGFloat
        
        if flag {
            fieldHeight = 60
        } else {
            fieldHeight = 40
        }
        
        passwordField.layer.cornerRadius = flag ? 23 : 13
        passwordField.placeholder = "Password"
        passwordField.font = UIFont(name: "Futura", size: 17)
        passwordField.leftView = leftPaddingView
        passwordField.leftViewMode = .always
        passwordField.clipsToBounds = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let height = NSLayoutConstraint(item: passwordField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: fieldHeight)
        
        let topConstraint = NSLayoutConstraint(item: passwordField!, attribute: .top, relatedBy: .equal, toItem: loginField, attribute: .bottom, multiplier: 1, constant: 15)
        
        let leftConstraint = NSLayoutConstraint(item: passwordField!, attribute: .left, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .left, multiplier: 1, constant: 15)

        NSLayoutConstraint.activate([
            height,
            topConstraint,
            leftConstraint
        ])
    }
    
    func setupSignInBtn() {
        let screenHeight = view.frame.height
        let flag = screenHeight > 667
        
        var fieldHeight: CGFloat
        var bottomConstant: CGFloat
        
        if flag {
            fieldHeight = 55
            bottomConstant = -75
        } else {
            fieldHeight = 40
            bottomConstant = -40
        }
        
        signInBtn.layer.masksToBounds = true
        signInBtn.backgroundColor = UIColor(red: 101/255, green: 195/255, blue: 101/255, alpha: 1)
        signInBtn.titleLabel!.font = UIFont.boldSystemFont(ofSize: 25)
        signInBtn.tintColor = .clear
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.layer.cornerRadius = flag ? 17 : 12
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let leftConstraint = NSLayoutConstraint(item: signInBtn!, attribute: .left, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .left, multiplier: 1, constant: 50)
        
        let bottomConstraint = NSLayoutConstraint(item: signInBtn!, attribute: .bottom, relatedBy: .equal, toItem: footerLbl, attribute: .top, multiplier: 1, constant: bottomConstant)
        
        let height = NSLayoutConstraint(item: signInBtn!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: fieldHeight)
        
        NSLayoutConstraint.activate([
            leftConstraint,
            bottomConstraint,
            height
        ])
    }
    
    func setupFooterLbl() {
        footerLbl.text = "Don't have an account? Sign up"
        footerLbl.textColor = .black
        footerLbl.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        footerLbl.textAlignment = .center
        
        footerLbl.translatesAutoresizingMaskIntoConstraints = false
        footerLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let leftConstraint = NSLayoutConstraint(item: footerLbl!, attribute: .left, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .left, multiplier: 1, constant: 30)

        let bottomConstraint = NSLayoutConstraint(item: footerLbl!, attribute: .bottom, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .bottom, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activate([
            leftConstraint,
            bottomConstraint
        ])
    }
}
