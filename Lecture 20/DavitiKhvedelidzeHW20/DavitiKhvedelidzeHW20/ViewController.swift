//
//  ViewController.swift
//  DavitiKhvedelidzeHW20
//
//  Created by Dato Khvedelidze on 09.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // Initializing main and background queues
    let mainQueue = DispatchQueue.main
    let backgroundQueue = DispatchQueue.global()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        buttonOutlet.setTitle("Calculate Prime Numbers", for: .normal)
        buttonOutlet.titleLabel?.textAlignment = .center
    }
    
    @IBAction func buttonAction(_ sender: Any) {

        // Shift to background thread to make calcuations
        backgroundQueue.async {
            // Shift back to main thread for UI changes
            self.mainQueue.async {
                self.setButtonInWaitingMode()
            }
            
            // Does calculations in background thread
            (0...100_000).forEach { number in
                if self.isPrime(num: number) {
                    print(number)
                }
            }
            print("Done")
            
            // Shift back to main thread for UI changes
            self.mainQueue.async {
                self.setButtonBackToNormal()
            }
        }
    }
    
    private func isPrime(num: Int) -> Bool {
        if num < 2 {
            return false
        }
        
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    private func setButtonInWaitingMode() {
        buttonOutlet.setTitle("Calculating...", for: .normal)
        buttonOutlet.tintColor = UIColor.gray
        
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    private func setButtonBackToNormal() {
        buttonOutlet.setTitle("Calculate Prime Numbers", for: .normal)
        buttonOutlet.tintColor = UIColor.systemBlue
        
        indicator.stopAnimating()
        indicator.isHidden = true
    }
}


