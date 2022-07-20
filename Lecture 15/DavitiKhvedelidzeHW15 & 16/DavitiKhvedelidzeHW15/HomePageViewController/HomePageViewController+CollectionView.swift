//
//  ViewController+CollectionView.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 14.07.22.
//

import UIKit

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Genre.allCases.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let allGenres = Genre.allCases
        
        let allGenreLabels = ["all"] + allGenres.map { $0.rawValue }

        let genre = allGenreLabels[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
                
        cell.setupCell(genre: genre)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let allGenres = Genre.allCases
        
        let allGenreLabels = ["all"] + allGenres.map { $0.rawValue }

        let genre = allGenreLabels[indexPath.row]
        
        genreToFilteryBy = genre
        
        if genreToFilteryBy != "all" {
            moviesFiltered = [
                Movie.movies.filter { $0.seen }.filter { $0.genre.rawValue == genreToFilteryBy },
                Movie.movies.filter { !$0.seen}.filter { $0.genre.rawValue == genreToFilteryBy }
            ]
        } else {
            moviesFiltered = [
                Movie.movies.filter { $0.seen },
                Movie.movies.filter { !$0.seen}
            ]
        }
        
        tableView.reloadData()

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: 100)
    
    }
    
    
}

