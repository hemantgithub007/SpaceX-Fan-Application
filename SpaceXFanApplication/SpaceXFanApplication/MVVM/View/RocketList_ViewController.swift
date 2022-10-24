//
//  RocketList_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit
import SVProgressHUD
import Kingfisher
import CoreData

class RocketList_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet var rocketListTable: UITableView!
    let hud = SVProgressHUD()
    
    var rocketDataViewModel = RocketDataViewModel()
    var rocketDataArr = [RocketDataModel]()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // Method to get the data from API
     func getRocketDataFromAPI() {
        
        let apiURL = Constants.baseUrl + APIPostString.Get_All_Rockets
        rocketDataViewModel.getRocketDataFromAPI(apiURL: apiURL, completion: { [weak self] rocketData in
            self?.rocketDataArr = rocketData
            DispatchQueue.main.async {
            self?.rocketListTable.reloadData()
            }
        })
    
}

    
    // MARK: LoadRocketDetailsVC extension for Table view Delegate & DataSource
    // MARK: - Number Of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketDataArr.count
    }
    
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell:RocketList_Cell = tableView.dequeueReusableCell(withIdentifier: "RocketList_Cell") as! RocketList_Cell
          cell.rocket_name.text = rocketDataArr[indexPath.row].name
          
          let hr_Image = self.rocketDataArr[indexPath.row].flickrImages[0] 
          if let url = URL(string: hr_Image )
          {
              do
              {
                  let resource = ImageResource(downloadURL: url)
                  KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                      switch result {
                      case .success(let value):
                          print("Image: \(value.image). Got from: \(value.cacheType)")
                          cell.rocket_image.image = value.image
                      case .failure(let error):
                          SVProgressHUD.dismiss()
                          print("Error: \(error)")
                      }
                  }
              }
          }
          
          cell.like_button.tag = indexPath.row
          cell.like_button.addTarget(self, action: #selector(click_To_add_Favourite(sender:)), for: .touchUpInside)
        
          if DatabaseHelper.shareInstance.someEntityExists_H(userId: rocketDataArr[indexPath.row].id) == true
              {
              cell.like_image.image = UIImage(named:"fav")
              }
             else
              {
                  cell.like_image.image = UIImage(named:"heart1")
             }

          return cell
      }
      
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = "Name : " + self.rocketDataArr[indexPath.row].name + "\n"
        + "Flight Number : " + String(self.rocketDataArr[indexPath.row].engines.number) + self.rocketDataArr[indexPath.row].engines.type + self.rocketDataArr[indexPath.row].engines.version + "\n"
        + "Launch Date : " + self.rocketDataArr[indexPath.row].firstFlight + "\n"
        + "Upcoming : False" + "\n" + "Details : " + self.rocketDataArr[indexPath.row].welcomeDescription + "\n" +  "Failure time : " + self.rocketDataArr[indexPath.row].firstFlight + "\n" + "Failure Reason : " + self.rocketDataArr[indexPath.row].type + "Engine Failure"
        let vc = UIStoryboard(name: "Detailboard", bundle: nil).instantiateViewController(withIdentifier: "RocketDetail_ViewController") as! RocketDetail_ViewController
        vc.rocketDiscription = str
        vc.titleRocketName = self.rocketDataArr[indexPath.row].name
        vc.detailImageurl = self.rocketDataArr[indexPath.row].flickrImages[0]
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
    @objc func click_To_add_Favourite(sender:UIButton)
    {
        DispatchQueue.main.async {
         
            
//            let indexPaths = IndexPath(row: sender.tag, section: 0)
           // let cell = self.rocketListTable.cellForRow(at: indexPaths) as! RocketList_Cell
            // Detail Page
            let str = "Name : " + self.rocketDataArr[sender.tag].name + "\n"
            + "Flight Number : " + String(self.rocketDataArr[sender.tag].engines.number) + self.rocketDataArr[sender.tag].engines.type + self.rocketDataArr[sender.tag].engines.version + "\n"
            + "Launch Date : " + self.rocketDataArr[sender.tag].firstFlight + "\n"
            + "Upcoming : False" + "\n" + "Details : " + self.rocketDataArr[sender.tag].welcomeDescription + "\n" +  "Failure time : " + self.rocketDataArr[sender.tag].firstFlight + "\n" + "Failure Reason : " + self.rocketDataArr[sender.tag].type + "Engine Failure"

        let dict:[String:String] = ["id":self.rocketDataArr[sender.tag].id,
                                    "rocketdetails":str,
                                    "rocketImage":self.rocketDataArr[sender.tag].flickrImages[0],
                                    "rocketName":self.rocketDataArr[sender.tag].name]
            
        DatabaseHelper.shareInstance.save(object: dict)
        self.rocketListTable.reloadData()

        }

    }
  

    
}
