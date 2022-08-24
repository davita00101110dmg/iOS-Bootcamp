//
//  ReminderCell.swift
//  DavitiKhvedelidzeHW25
//
//  Created by Dato Khvedelidze on 23.08.22.
//

import UIKit

class ReminderCell: UITableViewCell {
    
    
    @IBOutlet weak var reminderNameLabel: UILabel!
    @IBOutlet weak var reminderDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupElements()
    }
    
    private func setupElements() {
        reminderNameLabel.font = UIFont(name: "Futura-Bold", size: 20)
        reminderDetailsLabel.font = UIFont(name: "Futura", size: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
