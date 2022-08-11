//
//  DetailsViewController.swift
//  DavitiKhvedelidzeHW21
//
//  Created by Dato Khvedelidze on 11.08.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var isIndependentLabel: UILabel!
    
    
    var countryName = String()
    var countryFlag = String()
    var countryRegion = String()
    var countryCapital: String?
    var countryPopulation = Int()
    var countryisIndependent = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = UIColor.systemGray5
        
        flagImageView.load(url: URL(string: countryFlag)!)
        
        customLabel(on: countryNameLabel, with: countryName, fontSize: 28)
        customLabel(on: regionLabel, with: "Region - \(countryRegion)", fontSize: 20)
        customLabel(on: capitalLabel, with: "Capital - \(countryCapital ?? "None")", fontSize: 20)
        customLabel(on: populationLabel, with: "Population - \(String(describing: countryPopulation))", fontSize: 20 )
        customLabel(on: isIndependentLabel, with: countryisIndependent ? "Independent country" : "Dependent country", fontSize: 20)
        
    }
    
    private func customLabel(on label: UILabel, with content: String, fontSize: CGFloat) {
        label.text = content
        label.textAlignment = .center
        label.font = UIFont(name: "Futura", size: fontSize)
    }
}
