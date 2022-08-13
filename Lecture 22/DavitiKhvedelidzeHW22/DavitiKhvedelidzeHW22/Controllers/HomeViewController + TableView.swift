//
//  HomeViewController + TableView.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let currentMovie = self.movies[indexPath.row]
        
        cell.movieNameLabel.text = currentMovie.name
        cell.movieRatingLabel.text = String(describing: currentMovie.vote_average)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMovie = self.movies[indexPath.row]
    
        // Add id of the pressed movie to go on its details view
        let urlForCurrentMovie = self.urlStringForSingleMovie + String(describing: currentMovie.id)
        
        // Image url path
        let urlPathForImage = "https://image.tmdb.org/t/p/w185/"
        
        guard let imageUrl = URL(string: urlPathForImage + currentMovie.poster_path) else { return }
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        networkService.getData(with: urlForCurrentMovie, query: self.query) { (movie: DataResponse.Movie) in
            detailsVC.movieNameLabel.text = movie.name
            detailsVC.movieSummaryLabel.text = movie.overview
            detailsVC.movieRatingLabel.text = String(describing: movie.vote_average)
            detailsVC.movieImageView.load(url: imageUrl)
        }
    
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }

}
