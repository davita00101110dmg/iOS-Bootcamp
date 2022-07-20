//
//  ViewController.swift
//  TableView
//
//  Created by Dato Khvedelidze on 11.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        countriesTableView.delegate = self
//        countriesTableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        101
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
//        
//        let currentCountry = 
//        cell.flagLabel =

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    
}
