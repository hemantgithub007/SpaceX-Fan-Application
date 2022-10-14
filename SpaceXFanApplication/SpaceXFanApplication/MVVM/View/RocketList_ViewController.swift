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
    
    /// Roket detials view model
    var rocketDataViewModel = RocketDataViewModel()
    var rocketDataArr = [RocketDataModel]()
    
    var fetchFevRocketData = [FavouriteRocketData]()

    override func viewDidAppear(_ animated: Bool) {
        self.rocketListTable.reloadData()

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getRocketDataFromAPI()

    }
    
    // Method to get the data from API
    private func getRocketDataFromAPI() {
        rocketDataViewModel.getRocketDataFromAPI(completion: { [weak self] rocketData in
            self?.rocketDataArr = rocketData
            DispatchQueue.main.async {
                
                
                                // core date get all data
                                self!.fetchFevRocketData = DatabaseHelper.shareInstance.getAllData()
                
                                print("total core data count :  ", self!.fetchFevRocketData.count)
                
                //                print("core data get all data : ", self!.arrData)
                
                                for i in 0..<self!.fetchFevRocketData.count {
                
                                    print("core data get all data : "+(self!.fetchFevRocketData[i].id ?? "") + "\n")
                                }
                
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
          
          

          let strUrl = self.rocketDataArr[indexPath.row].flickrImages[0]
          let imgUrl = URL(string: strUrl)
          
          cell.rocket_image.kf.setImage(with: imgUrl)

          cell.like_button.tag = indexPath.row
          cell.like_button.addTarget(self, action: #selector(click_To_add_Favourite(sender:)), for: .touchUpInside)
          if self.fetchFevRocketData.contains(where: { $0.id == self.rocketDataArr[indexPath.row].id }) == true
              {
              cell.like_image.image = UIImage(named:"fav")
              cell.like_button.isSelected = true
              }
             else
              {
                  cell.like_image.image = UIImage(named:"heart1")
                  cell.like_button.isSelected = false
             }
              
          
          
          
          return cell
      }
      
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        self.navigationController?.pushViewController(detail, animated: true)
//
        let indexPaths = IndexPath(row: indexPath.row, section: 0)
        let cell = self.rocketListTable.cellForRow(at: indexPaths) as! RocketList_Cell
    
    }
    
    @objc func click_To_add_Favourite(sender:UIButton)
    {
        DispatchQueue.main.async {
         
        //........
        
        let indexPaths = IndexPath(row: sender.tag, section: 0)
        let cell = self.rocketListTable.cellForRow(at: indexPaths) as! RocketList_Cell
        
        if cell.like_button.isSelected == false
        {
        let dict:[String:String] = ["id":self.rocketDataArr[sender.tag].id]
        DatabaseHelper.shareInstance.save(object: dict)
            if self.fetchFevRocketData.count>0{
                self.fetchFevRocketData.removeAll()   }
        self.fetchFevRocketData = DatabaseHelper.shareInstance.getAllData()


        }
       else
        {
            
          
            DatabaseHelper.shareInstance.deleteData(indexs: sender.tag, idString: self.rocketDataArr[sender.tag].id)
            if self.fetchFevRocketData.count>0{
                self.fetchFevRocketData.removeAll()   }
            self.fetchFevRocketData = DatabaseHelper.shareInstance.getAllData()

            //            let indexPath = IndexPath(row:sender.tag, section:0)
//            if  if self.fetchFevRocketData.contains(where: { $0.id == self.rocketDataArr[indexPath.row].id }) == true {
//
//            }
//
       }
            self.rocketListTable.reloadData()

        }

    }
  

    
}
