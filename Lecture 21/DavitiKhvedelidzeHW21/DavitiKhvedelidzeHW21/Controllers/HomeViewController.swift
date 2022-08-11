//
//  ViewController.swift
//  DavitiKhvedelidzeHW21
//
//  Created by Dato Khvedelidze on 11.08.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Creating instance of network service
    let networkService = NetworkService.shared
    
    // Creating search controller
    let searchController = UISearchController(searchResultsController: nil)
    
    var countries = [Country]()
    var filteredCountries = [Country]()
    
    // Checking if search tab bar text is empty
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    // Checking if search tab should filter the data
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray5
        
        setupSearchBar()
        setupTableView()
        
        networkService.getCountries { countries in
            self.countries = countries
            self.tableView.reloadData()
        }
        
        // Assigning filtered countries to original countries array
        filteredCountries = countries
        
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Seach Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
    }
    
    internal func filterContentForSearchText(_ searchText: String) {
        
        // Checking if any country contains text that was wrriten in search bar and reloading data
        filteredCountries = countries.filter { (country: Country) -> Bool in
            return country.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
}
