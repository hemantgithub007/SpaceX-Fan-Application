//
//  UpComingList_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit

class UpComingList_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

//    /// Roket detials view model
//    var upcomingViewModel = UpcomingViewModel()
//    var upcomingRocketDataArr = [UpcomingModel]()
//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
      //  self.getUpcomingRocketDataFromAPI()

    }
    
    
//    // Method to get the data from API
//    private func getUpcomingRocketDataFromAPI() {
//
//        let apiURL = Constants.baseUrl + APIPostString.Get_Upcoming_Rockets
//        upcomingViewModel.getRocketDataFromAPI(apiURL: apiURL, completion: { [weak self] rocketData in
//            self?.upcomingRocketDataArr = rocketData
//            DispatchQueue.main.async {
//
//                print(self?.upcomingRocketDataArr[0].name ?? "")
//            }
//        })
//    }
    
    
    
    func callapigetRocketList(){
        NetworkManagerBlock().fetchData(withUrl: "launches/upcoming", completionHandler: {(obj) in
            DispatchQueue.main.async{
                print("Hemu++++=========================================================")
                print(obj)
                
                
      
                
                
                
            }
                })
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 10
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell:UpComingList_Cell = tableView.dequeueReusableCell(withIdentifier: "UpComingList_Cell") as! UpComingList_Cell
   
          return cell

      }
      
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    
    }
  
    

}
