//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Alex Roman on 7/16/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!
    
    @IBOutlet weak var backDrop: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadDetails()
    }
    
    func loadDetails(){
        let baseURL = "https://image.tmdb.org/t/p/w300"
        let backdropPath = movie["backdrop_path"] as! String
        let postPath = movie["poster_path"] as! String
        let backdropUrl = URL(string: (baseURL + backdropPath))!
        let posterUrl  = URL(string: (baseURL + postPath))!
        backDrop.af.setImage(withURL: backdropUrl)
        posterImage.af.setImage(withURL: posterUrl)
        nameLabel.text = movie["title"] as? String
        overviewLabel.text = movie["overview"] as? String
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
