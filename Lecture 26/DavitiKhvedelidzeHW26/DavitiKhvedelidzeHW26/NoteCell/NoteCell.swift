//
//  NoteCell.swift
//  DavitiKhvedelidzeHW26
//
//  Created by Dato Khvedelidze on 25.08.22.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        noteNameLabel.font = UIFont(name: "Futura", size: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
