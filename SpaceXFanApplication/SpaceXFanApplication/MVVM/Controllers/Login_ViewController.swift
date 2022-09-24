//
//  Login_ViewController.swift
//  SpaceXFanApplication
//
//  Created by teamcomputers on 24/09/22.
//

import UIKit
import LocalAuthentication


class Login_ViewController: UIViewController {

    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userPasswordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameView.layer.cornerRadius = 5.0
        self.userPasswordView.layer.cornerRadius = 5.0
        self.loginButton.layer.cornerRadius = 5.0

    }
    
    
    func authenticationWithTouchID() {
            let localAuthenticationContext = LAContext()
            localAuthenticationContext.localizedFallbackTitle = "Please use your Passcode"

            var authorizationError: NSError?
            let reason = "Authentication required to access the secure data"

            if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authorizationError) {
                
                localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, evaluateError in
                    
                    if success {
                        DispatchQueue.main.async() {
//                            let alert = UIAlertController(title: "Success", message: "Authenticated succesfully!", preferredStyle: UIAlertController.Style.alert)
//                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                            self.present(alert, animated: true, completion: nil)
//
                            let vc = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "Dashboard_ViewController") as! Dashboard_ViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        
                    } else {
                        // Failed to authenticate
                        guard let error = evaluateError else {
                            return
                        }
                        print(error)
                    
                    }
                }
            } else {
                
                guard let error = authorizationError else {
                    return
                }
                print(error)
            }
        }

    @IBAction func click_To_Login(_ sender: UIButton) {
        
        
        let vc = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "Dashboard_ViewController") as! Dashboard_ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func click_To_TouchID(_ sender: UIButton) {
        
        self.authenticationWithTouchID()

    }
    
}
