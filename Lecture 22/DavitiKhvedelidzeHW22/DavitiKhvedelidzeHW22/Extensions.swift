//
//  Extensions.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import UIKit

extension UIImageView {
    
    // Function for downloading image and transforming it to UIImage
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
