//
//  BeetListTableViewController.swift
//  Week4Network
//
//  Created by 정경우 on 2023/08/09.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher


struct BeerList {
    var name: String
    var image_url: String
    var description: String
}

class BeetListTableViewController: UITableViewController {
    var beerList1: [BeerList] = []
    @IBOutlet var beerListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beerListTableView.rowHeight = 200
        callReqest()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList1.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListTableViewCell") as! BeerListTableViewCell
        
        cell.beerListNameLabel.text = beerList1[indexPath.row].name
        cell.beerListDescription.text = beerList1[indexPath.row].description
        let url = URL(string: beerList1[indexPath.row].image_url)
        cell.beerListImageView.kf.setImage(with: url)
        
        return cell
    }
    
    
    
    
    func callReqest() {
        let url = "https://api.punkapi.com/v2/beers"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                
                for item in json.arrayValue {
                    let image_url = item["image_url"].stringValue
                    let description = item["description"].stringValue
                    let name = item["name"].stringValue
                    let beerInfo = BeerList(name: name, image_url: image_url, description: description)

                    self.beerList1.append(beerInfo)
                    self.beerListTableView.reloadData()
                    //print(self.beerList1)
                }
                print(self.beerList1)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}




