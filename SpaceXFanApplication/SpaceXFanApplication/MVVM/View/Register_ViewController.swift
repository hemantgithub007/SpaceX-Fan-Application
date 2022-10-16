//
//  Register_ViewController.swift
//  SpaceXFanApplication
//
//  Created by hemant kumar on 15/10/22.
//

import UIKit
import Firebase

class Register_ViewController: UIViewController {
    
    @IBOutlet weak var userNameView_Register: UIView!
    @IBOutlet weak var userPasswordView_Register: UIView!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet var userNameText_Register: UITextField!
    @IBOutlet var userPasswordText_Register: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userNameView_Register.layer.cornerRadius = 5.0
        self.userPasswordView_Register.layer.cornerRadius = 5.0
        self.registerButton.layer.cornerRadius = 5.0
        
        
    }
    
    @IBAction func click_To_LoginScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func click_To_register(_ sender: UIButton) {
        
        
        
        let emailValue = userNameText_Register.text ?? ""
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
        
        if (BSValidations.validatePassword(userPasswordText_Register.text ?? "") == false)
        {
            let alertController = UIAlertController(title: "Alert!", message: "Enter valid password.", preferredStyle:UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            { action -> Void in
                // Put your code here
            })
            self.present(alertController, animated: true, completion: nil)
            
            return
            
        }
        
        
        Auth.auth().createUser(withEmail: userNameText_Register.text ?? "", password: userPasswordText_Register.text ?? "") { authResult, error in
          // ...
            if error != nil
            {
                print(error?.localizedDescription ?? "Exceptions")
                let alert = UIAlertController(title: "Alert!", message: error?.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
                // change to desired number of seconds (in this case 5 seconds)
                let when = DispatchTime.now() + 2
                DispatchQueue.main.asyncAfter(deadline: when){
                    // your code with delay
                    alert.dismiss(animated: true, completion: {
                        
                      
                        
                    })
                }
            }
            else
            {
                print("Register Successfully : ",(authResult?.user.email ?? "") as String)

                
                let alert = UIAlertController(title: "Alert!", message: "Register Successfully", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
                // change to desired number of seconds (in this case 5 seconds)
                let when = DispatchTime.now() + 2
                DispatchQueue.main.asyncAfter(deadline: when){
                    // your code with delay
                    alert.dismiss(animated: true, completion: {
                        
                        self.navigationController?.popViewController(animated: true)

                        
                    })
                }

            }
        }
    }
    
    
    
    
}


extension Register_ViewController
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

