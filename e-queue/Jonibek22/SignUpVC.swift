//
//  SignUpVC.swift
//  electron_queue_system
//
//  Created by Shaimov Jonibek on 09/01/23.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var zaregistrBtn: UIButton!
   
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var passworTF: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var pNumberView: UIView!
    
    @IBOutlet weak var checkingBtn: UIButton!
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var btnCheck2: UIButton!
    
    @IBOutlet weak var lblCheck2: UILabel!
    
    var isValidPhoneNumber: Bool = false
    var isValidPassword: Bool = false
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        zaregistrBtn.isEnabled = false
        
    }
    
    @IBAction func voytiBtn(_ sender: Any) {
        let vc = VerificationCodeVC(nibName: "VerificationCodeVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupView(){
        
        pNumberView.clipsToBounds = true
        pNumberView.layer.borderWidth = 0.5
        pNumberView.layer.borderColor = UIColor.systemBlue.cgColor
        pNumberView.layer.cornerRadius = 28
        
        passwordView.clipsToBounds = true
        passwordView.layer.borderWidth = 0.5
        passwordView.layer.borderColor = UIColor.systemBlue.cgColor
        passwordView.layer.cornerRadius = 28
        phoneNumberTF.delegate = self
        passworTF.delegate = self
        
        phoneNumberTF.isPhoneNumberTf(phoneNumber: true)
    }
    
    
    @IBAction func eyeBtn(_ sender: Any) {
        passworTF.isSecureTextEntry.toggle()
        if !passworTF.isSecureTextEntry {
            if let image = UIImage(systemName: "eye") {
                (sender as AnyObject).setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash") {
                (sender as AnyObject).setImage(image, for: .normal)
            }
        }
        
        
    }

}
extension SignUpVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField == passworTF {
            
            guard let text = textField.text else { return }
            
            if text.count > 10 {
                checkingBtn.tintColor = .green
                lbl.textColor = .black
            }else {
                checkingBtn.tintColor = .systemGray2
                lbl.textColor = .systemGray2
            }
            if text.validate {
                btnCheck2.tintColor = .green
                lblCheck2.textColor = .black
            }else {
                btnCheck2.tintColor = .systemGray2
                lblCheck2.textColor = .systemGray2
            }
            
            self.isValidPassword = text.count > 10 && text.validate
            
            
        }else {
            if var text = textField.text {
                text = text.replacingOccurrences(of: "-", with: "")
                if text.count == 9 {
                    self.isValidPhoneNumber = true
                }else {
                    self.isValidPhoneNumber = false
                }
            }
        }
        
        zaregistrBtn.isEnabled = isValidPassword && isValidPhoneNumber
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTF {
            
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = newString.format
            
            return false
        }else {
            return true
        }
        
        
    }
}
