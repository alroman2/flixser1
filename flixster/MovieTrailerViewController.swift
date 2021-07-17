//
//  MovieTrailerViewController.swift
//  flixster
//
//  Created by Alex Roman on 7/16/21.
//

import UIKit
import WebKit
class MovieTrailerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var movieId: Int! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getTrailer()
    }
    
    func getTrailer(){
        let url = URL(string:"https://api.themoviedb.org/3/movie/\(String(describing: movieId))/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let req = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil,delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: req) {
            (data,response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                print(dataDictionary)
            }
        }
        
        task.resume()
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
