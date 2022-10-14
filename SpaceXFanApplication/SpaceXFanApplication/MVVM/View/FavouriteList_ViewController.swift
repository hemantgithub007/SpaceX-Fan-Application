//
//  FavouriteList_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit

class FavouriteList_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 10
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell:FavouriteList_Cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteList_Cell") as! FavouriteList_Cell
   
          return cell
        //  UITableViewStyle *cell
  //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
  //        cell?.textLabel?.text = array1[indexPath.row]
  //        cell?.detailTextLabel?.text = array2[indexPath.row]
  //        return cell!
      }
      
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        self.navigationController?.pushViewController(detail, animated: true)
//
        
    
    }
  
    

}
