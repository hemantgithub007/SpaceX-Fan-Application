//
//  RocketList_Cell.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 25/09/22.
//

import UIKit

class RocketList_Cell: UITableViewCell {

    
    @IBOutlet var rocket_image: UIImageView!
    @IBOutlet var like_image: UIImageView!
    @IBOutlet var rocket_name: UILabel!
    @IBOutlet var like_button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
