//
//  ViewController.swift
//  Constraints
//
//  Created by Dato Khvedelidze on 20.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var firstContainerView: UIView = {
        var firstContainerView = UIView()
        view.addSubview(firstContainerView)
        return firstContainerView
    }()
    
    let secondContainerView = UIView()
    let circleView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addfirstContainerView()
        addSecondContainerView()
        addCircle()
    }
    
    func addfirstContainerView() {
        firstContainerView.translatesAutoresizingMaskIntoConstraints = false
        firstContainerView.backgroundColor = .red
        view.addSubview(firstContainerView)
        
        let leftConstraint = NSLayoutConstraint(item: firstContainerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20)
        
        let topConstraint = NSLayoutConstraint(item: firstContainerView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20)
        
        let width = NSLayoutConstraint(item: firstContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        let height = NSLayoutConstraint(item: firstContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        leftConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
        height.isActive = true
    }
    
    func addSecondContainerView() {
        secondContainerView.translatesAutoresizingMaskIntoConstraints = false
        secondContainerView.backgroundColor = .blue
        view.addSubview(secondContainerView)
        
        let top = NSLayoutConstraint(item: secondContainerView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20)
        
        let left = NSLayoutConstraint(item: secondContainerView, attribute: .left, relatedBy: .equal, toItem: firstContainerView, attribute: .right, multiplier: 1, constant: 20)
        
        let right = NSLayoutConstraint(item: secondContainerView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -20)
        
        let height = NSLayoutConstraint(item: secondContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        NSLayoutConstraint.activate([
            top,
            left,
            right,
            height
        ])
        
    }
    
    func addCircle() {
        view.addSubview(circleView)
        let screenWidth = view.frame.width
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .yellow
        circleView.layer.cornerRadius = screenWidth / 6
        
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let width = NSLayoutConstraint(item: circleView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenWidth / 3)
        
        let aspectRatio = NSLayoutConstraint(item: circleView, attribute: .height, relatedBy: .equal, toItem: circleView, attribute: .width, multiplier: 1, constant: 0)
        
        width.isActive = true
        aspectRatio.isActive = true

//        circleView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 20).isActive = true
//        circleView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 20).isActive = true
    }
}

