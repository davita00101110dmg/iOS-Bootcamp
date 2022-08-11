//
//  HomeViewController + TableView.swift
//  DavitiKhvedelidzeHW21
//
//  Created by Dato Khvedelidze on 11.08.22.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // If user tries to filter data
        if isFiltering {
            return filteredCountries.count
        }
        
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        
        let currentCountry: Country
        
        // If user tries to filter data
        if isFiltering {
            currentCountry = filteredCountries[indexPath.row]
        } else {
            currentCountry = countries[indexPath.row]
        }

        cell.countryNameLabel.text = currentCountry.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCountry: Country
        
        // If user tries to filter data
        if isFiltering {
            currentCountry = filteredCountries[indexPath.row]
        } else {
            currentCountry = countries[indexPath.row]
        }
        
        let DetailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        DetailsVC.countryName = currentCountry.name
        DetailsVC.countryFlag = currentCountry.flags.png
        DetailsVC.countryRegion = currentCountry.region
        DetailsVC.countryCapital = currentCountry.capital
        DetailsVC.countryPopulation = currentCountry.population
        DetailsVC.countryisIndependent = currentCountry.independent
        
        self.navigationController?.pushViewController(DetailsVC, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {

        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }

}
