//
//  SuperHeroDetailsViewController.swift
//  flixster
//
//  Created by Alex Roman on 7/16/21.
//

import UIKit

class SuperHeroDetailsViewController: UIViewController {
    var movie: [String:Any]!
    @IBOutlet weak var backdropImgview: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var seeTrailerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadViewData()
    }
    
    func loadViewData(){
        let baseURL = "https://image.tmdb.org/t/p/w300"
        let backdropPath = movie["backdrop_path"] as! String
        let postPath = movie["poster_path"] as! String
        let backdropUrl = URL(string: (baseURL + backdropPath))!
        let posterUrl  = URL(string: (baseURL + postPath))!
        backdropImgview.af.setImage(withURL: backdropUrl)
        posterImgView.af.setImage(withURL: posterUrl)
        nameLabel.text = movie["title"] as? String
        overviewLabel.text = movie["overview"] as? String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let trailerVC = segue.destination as! MovieTrailerViewController
        trailerVC.movieId = movie["id"] as? Int
        
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
