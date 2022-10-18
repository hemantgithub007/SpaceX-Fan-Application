//
//  Login_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit
import LocalAuthentication
import Firebase
import SVProgressHUD

class Login_ViewController: UIViewController {

    let hud = SVProgressHUD()

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
    
    
    
    @IBAction func click_To_Register(_ sender: UIButton) {
        
   
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Register_ViewController") as! Register_ViewController
                self.navigationController?.pushViewController(vc, animated: true)
         
    }
    
    

    @IBAction func click_To_Login(_ sender: UIButton) {
     
        
        
        let emailValue = userNameText.text ?? ""
        if (validateEmail(enteredEmail: emailValue) == false)
        {
            let alertController = UIAlertController(title: "Alert!", message: "Enter valid e-mail", preferredStyle:UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if (BSValidations.validatePassword(userPasswordText.text ?? "") == false)
        {
            let alertController = UIAlertController(title: "Alert!", message: "Enter valid password.", preferredStyle:UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
            
            return
            
        }
        
        
     
        DispatchQueue.main.async {
                SVProgressHUD.setDefaultStyle(.custom)
                SVProgressHUD.setDefaultMaskType(.custom)
                SVProgressHUD.setForegroundColor(UIColor.white)           //Ring Color
                SVProgressHUD.setBackgroundColor(UIColor.init(hex: "0896D8"))        //HUD Color
                SVProgressHUD.setBackgroundLayerColor(UIColor .init(hex: "000000", alpha: 0))    //Background Color
                SVProgressHUD.show()
                
            }
        
        Auth.auth().signIn(withEmail: userNameText.text ?? "", password: userPasswordText.text ?? "") { (authResult, error) in

            if error != nil
            {
                print(error?.localizedDescription ?? "Exceptions")
                
                
                let alert = UIAlertController(title: "Alert!", message: error?.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
                // change to desired number of seconds (in this case 5 seconds)
                let when = DispatchTime.now() + 2
                DispatchQueue.main.asyncAfter(deadline: when){
                    // your code with delay
                    SVProgressHUD.dismiss()

                    alert.dismiss(animated: true, completion: {
                        

                        
                    })
                }
                
                
                
            }
            else
            {
                
             
                
                let alert = UIAlertController(title: "Alert!", message: "Login successfully", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
                // change to desired number of seconds (in this case 5 seconds)
                let when = DispatchTime.now() + 2
                DispatchQueue.main.asyncAfter(deadline: when){
                    // your code with delay
                    alert.dismiss(animated: true, completion: {
                        
                        SVProgressHUD.dismiss()

                        print("Login with ID : ",(authResult?.user.email ?? "") as String)

                        UserDefaults.standard.set(authResult?.user.email, forKey: "user")
                        let vc = UIStoryboard(name: "DashBoard", bundle: nil).instantiateViewController(withIdentifier: "Dashboard_ViewController") as! Dashboard_ViewController
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    })
                }
                
                
                
               
            }
        }
        
        
        
        
      
    }
    
    
    
    
    @IBAction func click_To_ForgotPassword(_ sender: UIButton) {
        let emailValue = userNameText.text ?? ""
        
        if (validateEmail(enteredEmail: emailValue) == false)
        {
            let alertController = UIAlertController(title: "Alert!", message: "Enter valid e-mail", preferredStyle:UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                                      { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else if emailValue == ""
        {
            let alertController = UIAlertController(title: "Alert!", message: "Enter Email to reset your password", preferredStyle:UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                                      { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else {
            
            Auth.auth().sendPasswordReset(withEmail: self.userNameText.text!) { (error) in
         
                
                
                if error != nil
                {
                    print(error?.localizedDescription ?? "Exceptions")
                }
                else
                {

                    let alertController = UIAlertController(title: "Alert!", message: "A password reset link sent to your Email Address", preferredStyle:UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                                              { action -> Void in
                        // Put your code here
                        self.userNameText.text! = ""
                        self.userPasswordText.text! = ""
                    })
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
                
            }
            
            
        }
        
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
