//
//  SignInVC.swift
//  electron_queue_system
//
//  Created by Shaimov Jonibek on 09/01/23.
//

import UIKit
import Alamofire

class SignInVC: UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var PhoneNumberView: UIView!
    @IBOutlet weak var numberTF: UITextField!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContanierView()
        validateTextField()
        
//        nextBtn.isEnabled = false
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
    
    //MARK: - IBAction functions
    
    @IBAction func voytiBtn(_ sender: Any) {
        
        checkForNet(connected: {
            self.loginRequest()
        },
                    noconnection: {})
        //        let vc = VerificationCodeVC(nibName: "VerificationCodeVC", bundle: nil)
        //        navigationController?.pushViewController(vc, animated: true)
        loader.startAnimating()
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
    
    //MARK: - Functions
    func validateTextField(){
        
        numberTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func loginRequest(){
        
        let stringUrl = "http://api.mobdev.uz/v1/user/login"
        let url = URL(string: stringUrl)
        
        let phoneNumber: String = (numberTF.text?.replacingOccurrences(of: "-", with: ""))!
        
        let param: [String : Any] = [
            "phone_number": "+998\(phoneNumber)",
            "password": passwordTF.text!
        ]
        
        AF.request(url!, method: .post, parameters: param).responseDecodable(of: LoginModel.self) { response in
            self.loader.stopAnimating()
            switch response.result {
                
                
            case .success(let result):
                
                if let _ = result.data {
                    print("Next")
                    
                    let tabBar = TabBarController()
                    tabBar.modalPresentationStyle = .fullScreen
                    self.present(tabBar, animated: true)
                    
                } else {
                    print(result.errors!)
                }
                
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - @objc functions
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if numberTF.text!.isEmpty || passwordTF.text!.isEmpty{
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        
        
    }
    
    
    
    func networkResult(loginModel: LoginDataModel) {
        
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

// networking
extension SignInVC {
    func singInApi(phoneNumber: String, password: String) {
        let stringUrl = "http://api.mobdev.uz/v1/user/login"
        guard let url = URL(string: stringUrl) else { return }
        
        let param: [String: Any] = [
            "phone_number": phoneNumber,
            "password": password
        ]
        
        AF.request(url, method: .post, parameters: param).responseDecodable(of: LoginModel.self) { response in
            switch response.result {
            case .success(let result):
                debugPrint(result)
                if let data =  result.data {
                    self.networkResult(loginModel: data)
                }else {
                    print("login yoki parol xato")
                }
                
            case .failure(let error):
                print("Fatal error", error)
            }
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
