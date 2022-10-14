//
//  Login_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit
import LocalAuthentication


class Login_ViewController: UIViewController {

    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userPasswordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var userPasswordText: UITextField!
    
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


extension Login_ViewController
{
    
    
    
    // email validationFuntion
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    

    // password validation
    
     func validatePassword(password : String) -> Bool {
        var isValid = false
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let checkPassword = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        isValid = checkPassword.evaluate(with: password)
        return isValid
    }
        
}
