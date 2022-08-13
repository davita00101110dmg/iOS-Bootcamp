//
//  DetailsViewController.swift
//  DavitiKhvedelidzeHW22
//
//  Created by Dato Khvedelidze on 13.08.22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    
//    var imageUrlString: String?
    
    var movieName = String()
    var movieSummary = String()
    var movieRating = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
//        movieImageView.load(url: URL(string: imageUrlString!)!)
    }
    
    private func setupUI() {
        customLabel(for: movieNameLabel, fontSize: 22)
        customLabel(for: movieSummaryLabel, fontSize: 18)
        customLabel(for: movieRatingLabel, fontSize: 18)
    }
    
    private func customLabel(for label: UILabel, fontSize: CGFloat) {
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Futura", size: fontSize)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
