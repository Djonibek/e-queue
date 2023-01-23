//
//  VerificationCodeVC.swift
//  electron_queue_system
//
//  Created by Shaimov Jonibek on 11/01/23.
//

import UIKit
import OTPFieldView


class VerificationCodeVC: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var reSendBtn: UIButton!
    @IBOutlet weak var otpFieldView: OTPFieldView!
    var countdownTimer: Timer!
    var totalTime = 59

    override func viewDidLoad() {
        super.viewDidLoad()

        reSendBtn.layer.borderColor = UIColor.systemBlue.cgColor
        reSendBtn.layer.borderWidth = 1.5
        startTimer()
       setupOtpFieldView()
    }
    func setupOtpFieldView() -> Bool{
        self.otpFieldView.fieldsCount = 4
        self.otpFieldView.fieldBorderWidth = 0.3
        self.otpFieldView.filledBorderColor = UIColor.green
        self.otpFieldView.defaultBorderColor = UIColor.systemBlue
        self.otpFieldView.cursorColor = UIColor.systemGray3
        self.otpFieldView.displayType = .roundedCorner
        self.otpFieldView.fieldSize = 60
        self.otpFieldView.separatorSpace = 20
        self.otpFieldView.shouldAllowIntermediateEditing = true
        self.otpFieldView.secureEntry = false
        self.otpFieldView.initializeUI()
        self.otpFieldView.delegate = self
        self.otpFieldView.clipsToBounds = true
        self.otpFieldView.layer.cornerRadius = 0
        if (otpFieldView != nil) {
                let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
                let characterSet = CharacterSet(charactersIn: "")
                return allowedCharacters.isSuperset(of: characterSet)
            }
        return true
    }
    
    @IBAction func daleBtn(_ sender: Any) {
        let tabbar = TabBarController()
        tabbar.modalPresentationStyle = .fullScreen
        self.present(tabbar, animated: true)
    }
    func startTimer() {
           countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
       }

    @objc func updateTime() {
           timerLabel.text = "\(timeFormatted(totalTime))"

           if totalTime != 0 {
               totalTime -= 1
           } else {
               endTimer()
           }
       }

       func endTimer() {
           countdownTimer.invalidate()
       }

       func timeFormatted(_ totalSeconds: Int) -> String {
           let seconds: Int = totalSeconds % 60
           let minutes: Int = (totalSeconds / 60) % 60
//           let hours: Int = totalSeconds / 3600
           return String(format: "%02d:%02d", minutes, seconds)
       }

    @IBAction func reSendBtn(_ sender: Any) {
        endTimer()
                totalTime = 59
                startTimer()
    }
     
}
extension VerificationCodeVC: OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print(otp)
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("Has entered Otp is \(hasEnteredAll)")
        return false
    }
    
    
}



