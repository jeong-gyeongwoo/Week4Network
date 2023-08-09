//
//  ViewController.swift
//  Week4Network
//
//  Created by 정경우 on 2023/08/09.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher


class BeerViewController: UIViewController {
    
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callReqest()
    }
    
    func callReqest() {
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                
                let imageURL = json[0]["image_url"].stringValue
                let description = json[0]["description"].stringValue
                let name = json[0]["name"].stringValue
                
                let url = URL(string: "\(imageURL)")
                self.beerImageView.kf.setImage(with: url)
                self.beerNameLabel.text = name
                self.descriptionLabel.text = description
                
            case .failure(let error):
                print(error)
            }
        }
    }
    @IBAction func showOtherBeer(_ sender: UIButton) {
        callReqest()
    }
    
}
