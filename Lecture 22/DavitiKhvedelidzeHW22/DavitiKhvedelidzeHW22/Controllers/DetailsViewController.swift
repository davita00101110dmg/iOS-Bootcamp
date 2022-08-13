//
//  DetailsViewController.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!

    var networkService = NetworkService()
    var movieID = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray5
        
        // URL For one movie with its ID
        let urlStringForSingleMovie = "https://api.themoviedb.org/3/tv/" + String(describing: self.movieID)
        
        networkService.getData(with: urlStringForSingleMovie) { (movie: DataResponse.Movie) in
            self.setupLabel(for: self.movieNameLabel, fontSize: 28, text: movie.name)
            self.setupLabel(for: self.movieSummaryLabel, fontSize: 18, text: movie.overview)
            self.setupLabel(for: self.movieRatingLabel, fontSize: 18, text: "Overall rating \(movie.vote_average)")
            
            // URL image path
            guard let urlForImage = URL(string: "https://image.tmdb.org/t/p/w185/" + String(describing: movie.poster_path)) else {
                print("Error while fetching the image of the movie")
                return
            }
            
            // Load movie image
            self.movieImageView.load(url: urlForImage)
        }
        
    }
    
    private func setupLabel(for label: UILabel, fontSize: CGFloat, text: String) {
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: fontSize)
    }

}
