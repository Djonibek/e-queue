//
//  TicketView.swift
//  E-Queue
//
//  Created by Muslim on 20/01/23.
//

import UIKit

class TicketView: UIView {
    
    var infoClosure: (() -> Void)? = nil
    var backClosure: (() -> Void)? = nil

    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Покупка валюты"
        
        return label
    }()
    
    let queueLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.text = "№87"
        label.textColor = .systemIndigo

        return label
    }()

    let messageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Скажите Ваш номер оператору"

        return label
    }()
    

    let dateLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "21 апреля, 10:15 - 10:30"
        
        return label
    }()
    
    let infoBtn : UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Открыть электронный талон"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .systemIndigo
        
        return button
    }()
    
    let backBtn : UIButton = {
       
        let button = UIButton()
        
        button.configuration = .plain()
        button.configuration?.title = "Назад"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .systemIndigo
        button.configuration?.background.strokeColor = .systemIndigo
        button.configuration?.background.strokeWidth = 1
        
        return button
    }()
    
    
    override func layoutSubviews() {
        
        setupSubviews()
        
    }
    
    
    func setupSubviews(){
        
        let innerStack = UIStackView(arrangedSubviews: [
            titleLabel, queueLabel, messageLabel, dateLabel
        ])
        innerStack.axis = .vertical
        innerStack.alignment = .center
        innerStack.distribution = .fill
        innerStack.spacing = 20
        
        let topStack = UIStackView(arrangedSubviews: [ innerStack ])
        topStack.axis = .horizontal
        topStack.alignment = .center
        topStack.distribution = .fill

        self.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        
        let line = UIView()
        line.backgroundColor = .systemGray3
        
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        
        infoBtn.addTarget(self, action: #selector(infoBtnPressed), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        let btnStack = UIStackView(arrangedSubviews: [infoBtn, backBtn])
        btnStack.axis = .vertical
        btnStack.distribution = .fillEqually
        btnStack.alignment = .fill
        btnStack.spacing = 20
        
        self.addSubview(btnStack)
        btnStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            topStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            topStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            topStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),

            line.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 20),
            line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            btnStack.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 20),
            btnStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            btnStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            btnStack.heightAnchor.constraint(equalToConstant: 120),
            btnStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 25)
            
        ])
    }
    
    @objc func infoBtnPressed(){
        if let infoClosure {
            infoClosure()
        }
    }
    
    @objc func backBtnPressed(){
        if let backClosure {
            backClosure()
        }
    }
}
