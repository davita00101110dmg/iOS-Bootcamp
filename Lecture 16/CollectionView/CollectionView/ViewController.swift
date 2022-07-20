//
//  ViewController.swift
//  CollectionView
//
//  Created by Dato Khvedelidze on 13.07.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SecondCustomCell", bundle: nil), forCellWithReuseIdentifier: "SecondCustomCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        
        cell.lbl.text = "123"
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCustomCell", for: indexPath) as? SecondCustomCell else { return UICollectionViewCell() }
        
        cell.lbl.text = "456"
        return cell
    }
    
    
}

