//
//  CountryCell.swift
//  DavitiKhvedelidzeHW21
//
//  Created by Dato Khvedelidze on 11.08.22.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        countryNameLabel.font = UIFont(name: "Futura", size: 18)
    }
    
}
