//
//  MovieCell.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    var movieName: String?
    var movieRating: Double?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        customLabel(for: movieNameLabel)
        customLabel(for: movieRatingLabel)
    }
    
    private func customLabel(for label: UILabel) {
        label.font = UIFont(name: "Futura", size: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
