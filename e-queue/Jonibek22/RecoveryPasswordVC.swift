//
//  RecoveryPasswordVC.swift
//  electron_queue_system
//
//  Created by Shaimov Jonibek on 13/01/23.
//

import UIKit

class RecoveryPasswordVC: UIViewController {

    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var phoneNumberTf: UITextField!
    
    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNumberView()
        
        setupTextFields()
        
        sendBtn.isEnabled = false
    }

    func setUpNumberView(){
        numberView.clipsToBounds = true
        numberView.layer.borderWidth = 0.5
        numberView.layer.borderColor = UIColor.systemBlue.cgColor
        numberView.layer.cornerRadius = 28

        phoneNumberTf.delegate = self
        phoneNumberTf.isPhoneNumberTf(phoneNumber: true)
    }
    
    
    @IBAction func nexttBtn(_ sender: Any) {
        let vc = VerificationCodeVC(nibName: "VerificationCodeVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTextFields() {
        phoneNumberTf.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
       
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if !phoneNumberTf.text!.isEmpty  {
            sendBtn.isEnabled = true
        } else {
            sendBtn.isEnabled = false
        }
        
    }
}
extension RecoveryPasswordVC: UITextFieldDelegate {
    
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
                sendBtn.isEnabled = true
            }else {
                sendBtn.isEnabled = false
            }
        }
    }
}

    


