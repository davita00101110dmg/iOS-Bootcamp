//
//  ViewController.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    var moviesFiltered = [
        Movie.movies.filter { $0.seen },
        Movie.movies.filter { !$0.seen}
    ]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureCollectionView()
    }
    
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureCollectionView() {
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        genresCollectionView.registerNib(class: GenreCell.self)
    }
    
}

