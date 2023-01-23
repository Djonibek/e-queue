//
//  SignInVC.swift
//  electron_queue_system
//
//  Created by Shaimov Jonibek on 09/01/23.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var PhoneNumberView: UIView!
    @IBOutlet weak var numberTF: UITextField!
        override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContanierView()
        validateTextField()
        
            nextBtn.isEnabled = false
        // in your viewDidLoad or viewWillAppear
//        navigationItem.backBarButtonItem = UIBarButtonItem(
//            title: "", style: .plain, target: nil, action: nil)

    }
    
    func setupContanierView () {
        PhoneNumberView.clipsToBounds = true
        PhoneNumberView.layer.borderWidth = 0.5
        PhoneNumberView.layer.borderColor = UIColor.systemBlue.cgColor
        PhoneNumberView.layer.cornerRadius = 28
        
        numberTF.delegate = self
        numberTF.isPhoneNumberTf(phoneNumber: true)
        
        passwordView.clipsToBounds = true
        passwordView.layer.borderWidth = 0.5
        passwordView.layer.borderColor = UIColor.systemBlue.cgColor
        passwordView.layer.cornerRadius = 28
    }
    
    
    @IBAction func voytiBtn(_ sender: Any) {
        let vc = VerificationCodeVC(nibName: "VerificationCodeVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
        
        
        
    }
    
    @IBAction func zaregistrBtn(_ sender: Any) {
        let vc = SignUpVC(nibName: "SignUpVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func reBuildPasswordBtn(_ sender: Any) {
        let vc = RecoveryPasswordVC(nibName: "RecoveryPasswordVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func eyeBtn(_ sender: Any) {
        
        passwordTF.isSecureTextEntry.toggle()
        if !passwordTF.isSecureTextEntry {
            if let image = UIImage(systemName: "eye") {
                (sender as AnyObject).setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash") {
                (sender as AnyObject).setImage(image, for: .normal)
            }
        }
        
    }
    func validateTextField(){
        
        numberTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if numberTF.text!.isEmpty || passwordTF.text!.isEmpty{
               nextBtn.isEnabled = false
           } else {
               nextBtn.isEnabled = true
           }
        
       
    }
}


extension SignInVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = newString.format
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if var text = textField.text {
            text = text.replacingOccurrences(of: "-", with: "")
            if text.count == 9 {
                nextBtn.isEnabled = true
            }else {
                nextBtn.isEnabled = false
            }
        }
    }
}

extension UITextField {
    func isValid(with word: String) -> Bool {
        guard let text = self.text,
              !text.isEmpty else {
            print("Please fill the field.")
            return false
        }
        
        guard text.contains(word) else {
            print("Wrong word. Please check again.")
            return false
        }
        
        return true
    }
}
