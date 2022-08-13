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
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        // Passing the current movie id to detailsVC
        detailsVC.movieID = currentMovie.id
    
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }

}
