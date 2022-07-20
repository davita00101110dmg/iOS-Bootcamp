//
//  DetailsViewController+CollectionView.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 15.07.22.
//

import UIKit

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currentMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsMovieCell", for: indexPath) as! DetailsMovieCell
        
        let allLabels = currentMovies.map { String($0.title) }
        let movieLabel = allLabels[indexPath.row]
        
        cell.detailsMovieLbl.text = movieLabel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieTitleField.text = currentMovies[indexPath.row].title
        
        movieReleaseDateField.text = "Release Date \(currentMovies[indexPath.row].releaseDate)"
        
        movieRatingField.text = "Imdb rating \(currentMovies[indexPath.row].imdb)"
        
        movieMainActorField.text = "Featuring \(currentMovies[indexPath.row].mainActor)"
        
        movieSeenField.text = currentMovies[indexPath.row].seen ? "Seen ✅" : "Has not seen ❌"
        
        movieisFavouriteField.text = currentMovies[indexPath.row].isFavourite ? "Favourite ❤️" : "Not favourite 💔"
        
        movieDescField.text = "Description: \(currentMovies[indexPath.row].description)"
        
        movieTitleField.text = currentMovies[indexPath.row].title
        
        makeFavouriteOutlet.isHidden = false
        
        collectionView.reloadData()
    }
    
}
