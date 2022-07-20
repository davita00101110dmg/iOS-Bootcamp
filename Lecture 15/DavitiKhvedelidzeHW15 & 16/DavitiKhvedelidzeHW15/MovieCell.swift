//
//  MovieTableViewCell.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import UIKit

//protocol MovieCellDelegate {
//    func toggleMovie(cell: MovieCell)
//}

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
//    var delegate: MovieCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func toggleMovie(_ sender: Any) {
//        delegate.toggleMovie(cell: self)
    }
    
}
