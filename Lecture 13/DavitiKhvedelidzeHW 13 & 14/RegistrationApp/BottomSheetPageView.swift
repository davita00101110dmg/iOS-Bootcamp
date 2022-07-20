//
//  BottomSheetPageView.swift
//  RegistrationApp
//
//  Created by Dato Khvedelidze on 10.07.22.
//

import UIKit

protocol CustomViewDelegate {
    func showAlert(with title: String)
}

class BottomSheetPageView: UIView {
    
    var delegate: CustomViewDelegate!
    var someAction: ((String)->())?
    
    @IBAction func yesButton(_ sender: Any) {
        print(123)
    }
    
    @IBAction func noButton(_ sender: Any) {
        print(234)
    }
    
//    private func commonInit() {
//        let bundle = Bundle.init(for: BottomSheetPageView.self)
//        if let viewToAdd = bundle.loadNibNamed("BottomSheetPageView", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
//            addSubview(contentView)
//            contentView.frame = self.bounds
//            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        }
//    }
}
