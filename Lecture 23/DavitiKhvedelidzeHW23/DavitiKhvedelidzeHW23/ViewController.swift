//
//  ViewController.swift
//  DavitiKhvedelidzeHW23
//
//  Created by Dato Khvedelidze on 16.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    var networkService = NetworkService()
    
    var allMovies = [DataResponse.Movie]()
    var similarMovies = [DataResponse.Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            // Calling function and storing all movies in constant
            // In case of failure printing error in case of success storing them in local variable
            let allMovies = await networkService.fetchMovies(with: "top_rated")
            
            switch allMovies {
            case .success(let response):
                self.allMovies = response.results
            case .failure(let error):
                print(error)
            }

            // Storing ID of a random movie to then use it for getting similar movies
            guard let randomMovieId = self.allMovies.randomElement()?.id else { return }

            let similarMovies = await networkService.fetchMovies(with: "\(randomMovieId)/similar?")
            
            switch similarMovies {
            case .success(let response):
                self.similarMovies = response.results
            case .failure(let error):
                print(error)
            }
            
            // Storing ID of a random movie again but this time using it for fetching one movie and its details
            guard let secondRandomMovieId = self.similarMovies.randomElement()?.id else { return }

            let randomMovie = await networkService.fetchMovieDetails(endpoint: "\(secondRandomMovieId)?")
            switch randomMovie {
            case .success(let movie):
                // Printing final answer of the task
                print("Movie - \(movie.name), number of episodes: \(movie.number_of_episodes)")
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}
