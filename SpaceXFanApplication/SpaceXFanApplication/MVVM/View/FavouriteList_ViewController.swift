//
//  FavouriteList_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit
import CoreData
import Kingfisher

class FavouriteList_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var favourit_TableView: UITableView!
    var fetchFevRocketData = [FavouriteRocketData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//    //.................fetch data from core data......................
//        self.fetchFevRocketData = DatabaseHelper.shareInstance.fetchAllData()
//        self.favourit_TableView.reloadData()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //.................fetch data from core data......................
            self.fetchFevRocketData = DatabaseHelper.shareInstance.fetchAllData()
            self.favourit_TableView.reloadData()

    }
    
    
    

    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return fetchFevRocketData.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell:FavouriteList_Cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteList_Cell") as! FavouriteList_Cell
          
          cell.rocketFAV_name.text = self.fetchFevRocketData[indexPath.row].rocketName
   
          
          let hr_Image = self.fetchFevRocketData[indexPath.row].rocketImage
          
          if let url = URL(string: hr_Image ?? "")
          {
              do
              {
                  let resource = ImageResource(downloadURL: url)
                  KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                      switch result {
                      case .success(let value):
                          print("Image: \(value.image). Got from: \(value.cacheType)")
                          
                          cell.rocketFAV_image.image = value.image
                      case .failure(let error):
                          print("Error: \(error)")
                      }
                  }
              }
          }
          
        

          cell.likeFAV_button.tag = indexPath.row
          cell.likeFAV_button.addTarget(self, action: #selector(click_To_add_DeleteFavourite(sender:)), for: .touchUpInside)
          cell.likeFAV_image.image = UIImage(named:"fav")
             

   
          return cell

      }
      
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    
    }
  
    
    
    //..........Delete From Favourite List and Core data entity.................
    @objc func click_To_add_DeleteFavourite(sender:UIButton) {
        
        print("Deleted ID : ",self.fetchFevRocketData[sender.tag].id ?? "")
    DatabaseHelper.shareInstance.deleteData(idString: self.fetchFevRocketData[sender.tag].id ?? "")
        self.fetchFevRocketData.remove(at: sender.tag)
        self.favourit_TableView.reloadData()
        
        
    }
    

}
