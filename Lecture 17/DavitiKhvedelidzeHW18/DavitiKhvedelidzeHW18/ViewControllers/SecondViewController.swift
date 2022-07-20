//
//  SecondViewController.swift
//  DavitiKhvedelidzeHW17
//
//  Created by Dato Khvedelidze on 19.07.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var elgatoImage: UIImageView!
    
    
    let imageOriginBounds = CGRect(x: 130.0, y: 313.0, width: 168.0, height: 300.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTap()
        addSwipe()
        addPinch()
    }
    
    func addTap() {
        let tappedGesture = UITapGestureRecognizer(target: self, action: #selector(dismissImage))
        elgatoImage.addGestureRecognizer(tappedGesture)
    }
    
    func addSwipe() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        rightSwipeGesture.direction = .right
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        leftSwipeGesture.direction = .left
        
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        upSwipeGesture.direction = .up
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        downSwipeGesture.direction = .down
        
        elgatoImage.addGestureRecognizer(rightSwipeGesture)
        elgatoImage.addGestureRecognizer(leftSwipeGesture)
        elgatoImage.addGestureRecognizer(upSwipeGesture)
        elgatoImage.addGestureRecognizer(downSwipeGesture)
    }
    
    func addPinch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchedOnView))
        elgatoImage.addGestureRecognizer(pinchGesture)
    }
    
    @objc func dismissImage(gesture: UITapGestureRecognizer) {
        //MARK: if image will be pressed for less than 1 second then:
        //        self.navigationController?.popToRootViewController(animated: true)
        //MARK: if else more than 1 second then make image dissapear with animation
        UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseOut) {
            self.elgatoImage.alpha = 0.0
        }
    }
    
    @objc func swipedOnView(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right:
            elgatoImage.frame.origin.x += 50
        case .left:
            elgatoImage.frame.origin.x -= 50
        case .up:
            elgatoImage.frame.origin.y += 50
        case .down:
            elgatoImage.frame.origin.y -= 50
        default:
            break
        }
    }
    
    @objc func pinchedOnView(gesture: UIPinchGestureRecognizer) {
        //MARK: if photo will be out of the superclass turn back to origin size
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        gesture.scale = 1
        if gesture.view?.frame.width ?? 0 > super.view.frame.width || gesture.view?.frame.height ?? 0 > super.view.frame.height {
            gesture.view?.frame = imageOriginBounds
            
            let information = ["Color" : UIColor.random()]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "com.TBCLectures.DavitiKhvedelidzeHW17.BackgroundColorChangeNotification"), object: nil, userInfo: information)

        }
        
    }
}
