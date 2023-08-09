//
//  BeerListTableViewCell.swift
//  Week4Network
//
//  Created by 정경우 on 2023/08/10.
//

import UIKit



class BeerListTableViewCell: UITableViewCell {

    
    @IBOutlet var beerListDescription: UILabel!
    @IBOutlet var beerListNameLabel: UILabel!
    @IBOutlet var beerListImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
