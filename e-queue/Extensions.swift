//
//  Extensions.swift
//  electron_queue_system
//
//  Created by Shaimov Jonibek on 11/01/23.
//

import Foundation
import UIKit

extension String {
    var validate: Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let capitalLetter = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx).evaluate(with: self)
        
        let numberRegEx  = ".*[0-9]+.*"
        let number = NSPredicate(format:"SELF MATCHES %@", numberRegEx).evaluate(with: self)
        
        return capitalLetter && number
    }
    
    /// mask example: `+X (XXX) XXX-XXXX`
    var format: String {
        let mask = "XX-XXX-XX-XX"
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
}

extension UITextField {
    func isPhoneNumberTf(phoneNumber: Bool) {
        
        if phoneNumber {
            let leftL = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            leftL.text = "+998 "
            leftL.font = self.font
            self.leftView = leftL
            self.leftViewMode = .always
            self.clearButtonMode = .always
            
        }
    }
    
}
