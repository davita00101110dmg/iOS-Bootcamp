//
//  CustomButton.swift
//  RegistrationApp
//
//  Created by Dato Khvedelidze on 05.07.22.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pinkButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pinkButton()
    }
    
    func pinkButton() {
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
}
