//
//  GenreCell.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 14.07.22.
//

import UIKit

class GenreCell: UICollectionViewCell {

    @IBOutlet weak var genreLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(genre: String) {
        self.genreLbl.text = genre
    }
    
}
