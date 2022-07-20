//
//  ViewController+TableView.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 14.07.22.
//

import UIKit

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        moviesFiltered.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesFiltered[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Seen Movies"
        } else {
            return "Watchlist"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let movie = moviesFiltered[indexPath.section][indexPath.row]
        detailsVC.movieTitle = movie.title
        detailsVC.movieRating = "Imdb rating \(movie.imdb)"
        detailsVC.movieReleaseDate = "Release Date \(movie.releaseDate)"
        detailsVC.movieMainActor = "Featuring \(movie.mainActor)"
        detailsVC.movieSeen = movie.seen ? "Seen ✅" : "Has not seen ❌"
        detailsVC.movieIsFavourite = movie.isFavourite ? "Favourite ❤️" : "Not favourite 💔"
        detailsVC.movieDesc = "Description: \(movie.description)"
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = moviesFiltered[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movieTitle.text = movie.title
        cell.movieRating.text = "\(movie.imdb)"
        
        return cell
    }
}
