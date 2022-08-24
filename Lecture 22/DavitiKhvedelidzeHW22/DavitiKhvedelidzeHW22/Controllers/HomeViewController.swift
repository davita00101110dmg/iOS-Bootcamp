//
//  ViewController.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 12.08.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var networkService = NetworkService.shared
    var movies = [DataResponse.Movie]()
    var sessionID = String()
    
    // URL For all movies
    private let urlStringForTopMovies = "https://api.themoviedb.org/3/tv/top_rated"
    
    // URL To get sessionID
    private let urlStringForSessionID = "https://api.themoviedb.org/3/authentication/guest_session/new"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        // Calling function to fill movies array
        networkService.getData(with: urlStringForTopMovies) { (movies: DataResponse) in
            self.movies = movies.results
            self.tableView.reloadData()
        }
        
        // Calling function to get sessionID
        networkService.getData(with: urlStringForSessionID) { (session: DataResponse.Session) in
            self.sessionID = session.guest_session_id
        }
        
        //TODO: make POST request
//        let urlStringToPostRating = "https://api.themoviedb.org/3/tv/110309/rating"
//        networkService.postData(urlString: url, query: query, rating: 10.0)
        
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }

}

