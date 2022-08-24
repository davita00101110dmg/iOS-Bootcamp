//
//  DirectoryCell.swift
//  DavitiKhvedelidzeHW25
//
//  Created by Dato Khvedelidze on 23.08.22.
//

import UIKit

class DirectoryCell: UITableViewCell {

    @IBOutlet weak var directoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupElements()
    }

    private func setupElements() {
        directoryNameLabel.font = UIFont(name: "Futura", size: 20)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
