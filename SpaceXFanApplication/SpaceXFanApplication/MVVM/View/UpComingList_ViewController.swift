//
//  UpComingList_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit
import SVProgressHUD


class UpComingList_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    /// Roket detials view model
    var upcomingViewModel = UpcomingRocketDataViewModel()
    var upcomingRocketDataArr = [UpcomingRocketDataModel]()

    @IBOutlet weak var upcomingEocketList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
      //  self.getUpcomingRocketDataFromAPI()

    }
 
    
    
    
    func callapigetRocketList(){
        
        DispatchQueue.main.async {
                SVProgressHUD.setDefaultStyle(.custom)
                SVProgressHUD.setDefaultMaskType(.custom)
                SVProgressHUD.setForegroundColor(UIColor.white)           //Ring Color
                SVProgressHUD.setBackgroundColor(UIColor.init(hex: "0896D8"))        //HUD Color
                SVProgressHUD.setBackgroundLayerColor(UIColor .init(hex: "000000", alpha: 0))    //Background Color
                SVProgressHUD.show()
                
            }
                let apiURL = Constants.baseUrl + APIPostString.Get_Upcoming_Rockets
                upcomingViewModel.getRocketDataFromAPI(apiURL: apiURL, completion: { [weak self] rocketData in
                    self?.upcomingRocketDataArr = rocketData
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()

                        self?.upcomingEocketList.reloadData()
                        print(" ===============>>>>>>> : ",self?.upcomingRocketDataArr[0].name ?? "")
                        print(" ===============>>>>>>> : ",self?.upcomingRocketDataArr[17].name ?? "")
                    }
                })
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return self.upcomingRocketDataArr.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell:UpComingList_Cell = tableView.dequeueReusableCell(withIdentifier: "UpComingList_Cell") as! UpComingList_Cell
          
          cell.rocketNameLabel.text = self.upcomingRocketDataArr[indexPath.row].name ?? ""
   
          return cell

      }
      
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    
    }
  
    

}
