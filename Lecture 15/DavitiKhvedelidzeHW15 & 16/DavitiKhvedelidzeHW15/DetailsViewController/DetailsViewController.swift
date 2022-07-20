//
//  DetailsViewController.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    
    @IBOutlet weak var genreField: UILabel!
    
    @IBOutlet weak var movieTitleField: UILabel!
    @IBOutlet weak var movieReleaseDateField: UILabel!
    @IBOutlet weak var movieRatingField: UILabel!
    @IBOutlet weak var movieMainActorField: UILabel!
    @IBOutlet weak var movieSeenField: UILabel!
    @IBOutlet weak var movieisFavouriteField: UILabel!
    @IBOutlet weak var movieDescField: UILabel!
    
    @IBOutlet weak var makeFavouriteOutlet: UIButton!
    
    var currentMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        detailsCollectionView.registerNib(class: DetailsMovieCell.self)
        genreField.text = "\(genreToFilteryBy) movies"
                
    }
    
    @IBAction func makeFavourite(_ sender: Any) {
//        let currentMovie = Movie.movies.filter { $0.title == movieTitleField.text }
    }
    
}



