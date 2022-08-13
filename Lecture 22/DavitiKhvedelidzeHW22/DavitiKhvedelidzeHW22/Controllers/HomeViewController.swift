//
//  ViewController.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 12.08.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var networkService = NetworkService()
    var movies = [DataResponse.Movie]()
    
    // URL For all movies
    private let urlStringForTopMovies = "https://api.themoviedb.org/3/tv/top_rated"
    
    // URL For one movie (without ID until any of the movies will be pressed)
    var urlStringForSingleMovie = "https://api.themoviedb.org/3/tv/"
    
    let query = [
        URLQueryItem(name: "api_key", value: "036b7ff90b99f9de8cc6bd344efd7450")
    ]
    
    //MARK: for later usage
//    var sessionID = String()
//    let urlForSessionID = "https://api.themoviedb.org/3/authentication/guest_session/new"
//        networkService.getData(urlString: urlForSessionID, query: query) {(session: DataResponse.Session) in
//            self.sessionID = session.guest_session_id
//            print(self.sessionID)
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        networkService.getData(with: urlStringForTopMovies, query: query) { (movies: DataResponse) in
            self.movies = movies.results
            self.tableView.reloadData()
        }

    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }

}

