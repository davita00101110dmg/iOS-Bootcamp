//
//  ViewController.swift
//  DavitiKhvedelidzeHW17
//
//  Created by Dato Khvedelidze on 19.07.22.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var redCircle: UIView!
    @IBOutlet weak var blueCircle: UIView!
    @IBOutlet weak var purpleTriangle: UIView!
    @IBOutlet weak var blackTriangle: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redCircle.frame = CGRect(x: view.frame.width/2 - 150, y: view.frame.height/4 - 50, width: 100, height: 100)
        blueCircle.frame = CGRect(x: view.frame.width/2 + 50, y: view.frame.height/4 - 50, width: 100, height: 100)
        purpleTriangle.frame = CGRect(x: view.frame.width/2 - 150, y: view.frame.height/2 + 50, width: 100, height: 100)
        blackTriangle.frame = CGRect(x: view.frame.width/2 + 50, y: view.frame.height/2 + 50, width: 100, height: 100)
        
        view.addSubview(redCircle)
        view.addSubview(blueCircle)
        view.addSubview(purpleTriangle)
        view.addSubview(blackTriangle)
        
        setupNotfication()
        setupFigures()
        tapped()
    }

    private func setupFigures() {
        drawCircle(circle: redCircle, color: .red)
        drawCircle(circle: blueCircle, color: .blue)
        drawTriangle(triangle: purpleTriangle, color: .purple)
        drawTriangle(triangle: blackTriangle, color: .black)
    }
    
    func tapped() {
        let redCircleTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSecondView))
        let blueCircleTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSecondView))
        let purpleTriangleTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSecondView))
        let blackTriangleTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSecondView))

        redCircle.addGestureRecognizer(redCircleTapGesture)
        blueCircle.addGestureRecognizer(blueCircleTapGesture)
        purpleTriangle.addGestureRecognizer(purpleTriangleTapGesture)
        blackTriangle.addGestureRecognizer(blackTriangleTapGesture)
    }
    
    func setupNotfication() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackground), name: Notification.Name(rawValue: "com.TBCLectures.DavitiKhvedelidzeHW17.BackgroundColorChangeNotification"), object: nil)
    }
    
    @objc func goToSecondView(gesture: UITapGestureRecognizer) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc func changeBackground(notification: Notification) {
        if let color = notification.userInfo?["Color"] as? UIColor {
            self.view.backgroundColor = color
        }
    }
}

