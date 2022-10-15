//
//  Login_ViewController.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import Foundation
import UIKit

class BSValidations: NSObject {
    
    /*class func sharedInstance() -> DSValidations? {
        var validations: DSValidations? = nil
        if validations == nil {
            validations = DSValidations()
        }
        return validations
    }*/
    
    class func validateEmailAddress(_ emailAddress: String?) -> Bool {
        var isValid = false
        let emailRegex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isValid = emailTest.evaluate(with: emailAddress)
        return isValid
    }
    
    class func validatePhone(_ phoneNumber: String?) -> Bool {
        var isValid = false
        let phoneRegex = "^((\\+)|(00))[0-9]{6,14}$"
        let test = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        isValid = test.evaluate(with: phoneNumber)
        return isValid
    }
    
    class func validatePassword(_ password : String) -> Bool {
        var isValid = false
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let checkPassword = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        isValid = checkPassword.evaluate(with: password)
        return isValid
    }
    
//    class func validateMobileNumber(_ mobileNumber: NSNumber?) -> Bool {
//        var isValid = false
//        let phoneRegex = "^([+]{1})([0-9]{2,6})([-]{1})([0-9]{10})$"
//        let test = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
//        isValid = test.evaluate(with: mobileNumber)
//        return isValid
//    }
    
    class func validateRequiredTextField(_ textField: UITextField?) -> Bool {
        var isValid = false
        // Remove white space from left and right of string
        let onlyText: String? = textField?.text?.trimmingCharacters(in: CharacterSet.whitespaces)
        if (onlyText?.count ?? 0) > 0 {
            isValid = true
        }
        else {
            isValid = false
        }
        return isValid
    }
    
//    class func validateRequiredTextView(_ textView: UITextView?) -> Bool {
//        var isValid = false
//        // Remove white space from left and right of string
//        let onlyText: String = (textView?.text.trimmingCharacters(in: CharacterSet.whitespaces))!
//        if onlyText.count > 0 {
//            isValid = true
//        }
//        else {
//            isValid = false
//
//        }
//        return isValid
//    }
//
    class func validateRequiredTextView(_ textView: String?) -> Bool {
        var isValid = false
        // Remove white space from left and right of string
        let onlyText: String = (textView?.trimmingCharacters(in: CharacterSet.whitespaces))!
        if onlyText.count > 0 {
            isValid = true
        }
        else {
            isValid = false
            
        }
        return isValid
    }
    class func validateMobileNumber(_ mobileNumber: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: mobileNumber)
        return result
    }
}
