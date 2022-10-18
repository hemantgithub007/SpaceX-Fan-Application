//
//  FavouriteList_Cell.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 25/09/22.
//

import UIKit

class FavouriteList_Cell: UITableViewCell {

    @IBOutlet var rocketFAV_image: UIImageView!
    @IBOutlet var likeFAV_image: UIImageView!
    @IBOutlet var rocketFAV_name: UILabel!
    @IBOutlet var likeFAV_button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
