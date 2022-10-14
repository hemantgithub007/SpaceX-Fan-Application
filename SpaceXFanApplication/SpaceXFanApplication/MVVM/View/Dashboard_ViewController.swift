//
//  Dashboard_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit

class Dashboard_ViewController: UIViewController {

    
    @IBOutlet var headerView: UIView!
    let rocketsButton = UIButton()
    let favouritesButton = UIButton()
    let upcomingButtons = UIButton()
    let navBar = UIView()
    
    
    
//    lazy var rocketList_ViewController : RocketList_ViewController = {
//
//       let storyBoard = UIStoryboard(name: "RocketList_ViewController", bundle: Bundle.main)
//
//       var viewController = storyBoard.instantiateViewController(withIdentifier: "") as! RocketList_ViewController
//
//        self.asChildViewController
//
//   }()

    @IBOutlet var rocketView: UIView!
    @IBOutlet var favouriteView: UIView!
    @IBOutlet var upComingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rocketView.isHidden = false
        favouriteView.isHidden = true
        upComingView.isHidden = true
        
        self.headerButtons()
        
        
        
        
        
    }
    
    func addChildClasses() {
         
    }
    
    
    
    func headerButtons() {
        rocketsButton.setTitle("Rockets", for: .normal)
        rocketsButton.tag = 0
        rocketsButton.setTitleColor(.white, for: .normal)
        rocketsButton.frame = CGRect(x: 0, y: 40 , width: self.view.frame.size.width/3, height: 30)
        rocketsButton.addTarget(self, action: #selector(tapOption(sender:)), for: .touchUpInside)
        self.headerView.addSubview(rocketsButton)
        
        
        favouritesButton.setTitle("Favourite", for: .normal)
        favouritesButton.tag = 1
        favouritesButton.setTitleColor(.white, for: .normal)
        favouritesButton.frame = CGRect(x: self.view.frame.size.width/3, y: 40 , width: self.view.frame.size.width/3, height: 30)
        favouritesButton.addTarget(self, action: #selector(tapOption(sender:)), for: .touchUpInside)
        self.headerView.addSubview(favouritesButton)
        
        
        upcomingButtons.setTitle("Up Coming", for: .normal)
        upcomingButtons.tag = 2
        upcomingButtons.setTitleColor(.white, for: .normal)
        upcomingButtons.frame = CGRect(x: (self.view.frame.size.width/3) * 2, y: 40 , width: self.view.frame.size.width/3, height: 30)
        upcomingButtons.addTarget(self, action: #selector(tapOption(sender:)), for: .touchUpInside)
        self.headerView.addSubview(upcomingButtons)
        
        
        navBar.frame = CGRect(x: 0, y: 72 , width: self.view.frame.size.width/3, height: 8)
        navBar.layer.cornerRadius = 4.0
        navBar.backgroundColor = UIColor.init(hex: "285CC1")
        self.headerView.addSubview(navBar)
        
        
    }
    
    
    
    @objc func tapOption(sender : UIButton) {
        print(sender.tag)
        if sender.tag == 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.navBar.frame = CGRect(x: 0, y: 72 , width: self.view.frame.size.width/3, height: 8)
                self.navBar.layoutIfNeeded()
            })
            
            rocketView.isHidden = false
            favouriteView.isHidden = true
            upComingView.isHidden = true
            
        }
        else if sender.tag == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.navBar.frame = CGRect(x: self.view.frame.size.width/3, y: 72 , width: self.view.frame.size.width/3, height: 8)

                self.navBar.layoutIfNeeded()
            })
            rocketView.isHidden = true
            favouriteView.isHidden = false
            upComingView.isHidden = true
        }
        else if sender.tag == 2 {
            UIView.animate(withDuration: 0.3, animations: {
                self.navBar.frame = CGRect(x: (self.view.frame.size.width/3) * 2, y: 72 , width: self.view.frame.size.width/3, height: 8)

                self.navBar.layoutIfNeeded()
            })
            rocketView.isHidden = true
            favouriteView.isHidden = true
            upComingView.isHidden = false
        }
    }

}
