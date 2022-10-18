//
//  RocketDetail_ViewController.swift
//  SpaceXFanApplication
//
//  Created by hemant kumar on 16/10/22.
//

import UIKit
import Kingfisher
class RocketDetail_ViewController: UIViewController {
    
    var rocketDiscription = String()
    var titleRocketName = String()
    var detailImageurl = String()
    
    @IBOutlet weak var rocketName: UILabel!
    
    @IBOutlet weak var rocketImage: UIImageView!
    
    @IBOutlet weak var rocketDetailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        rocketDetailLabel.text = rocketDiscription
        rocketName.text = titleRocketName
        
        if let url = URL(string: self.detailImageurl )
        {
            do
            {
                let resource = ImageResource(downloadURL: url)
                KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                    switch result {
                    case .success(let value):
                        print("Image: \(value.image). Got from: \(value.cacheType)")
                        
                        self.rocketImage.image = value.image
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
            }
        }    }
    
    @IBAction func click_To_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

    }
   

}
