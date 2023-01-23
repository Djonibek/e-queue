//
//  ConfirmView.swift
//  E-Queue
//
//  Created by Muslim on 20/01/23.
//

import UIKit

class ConfirmView: UIView {
    
    var confirmClosure: (() -> Void)? = nil
    var cancelClosure: (() -> Void)? = nil
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Подключение"
        
        return label
    }()
    
    let queueLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Перед Вами"

        return label
    }()

    let messageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Получить электронный талон?"

        return label
    }()
    

    let queueNumberBtn : UIButton = {
        let button = UIButton()

        button.configuration = .filled()
        button.configuration?.image = UIImage(systemName: "person.2")
        button.configuration?.imagePadding = 10
        button.configuration?.cornerStyle = .capsule
        button.configuration?.title = "5"
        button.configuration?.baseBackgroundColor = .systemIndigo
        button.isUserInteractionEnabled = false

        return button
    }()
    
    let confirmBtn : UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Да"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .systemIndigo
        
        return button
    }()
    
    let cancelBtn : UIButton = {
       
        let button = UIButton()
        
        button.configuration = .plain()
        button.configuration?.title = "Нет"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .systemIndigo
        button.configuration?.background.strokeColor = .systemIndigo
        button.configuration?.background.strokeWidth = 1
        
        return button
    }()
    
    
    override func layoutSubviews() {
        
        setupSubViews()
        
        
    }
    
    override func draw(_ rect: CGRect) {
        
        
    }
    
    func setupSubViews(){
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let queueStack = UIStackView(arrangedSubviews: [queueLabel, queueNumberBtn])

        queueStack.axis = .horizontal
        queueStack.distribution = .equalSpacing
        queueStack.alignment = .fill

        self.addSubview(queueStack)
        queueStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let line = UIView()
        line.backgroundColor = .systemGray3
        
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        
        confirmBtn.addTarget(self, action: #selector(confirmBtnPressed), for: .touchUpInside)
        cancelBtn.addTarget(self, action: #selector(cancelBtnPressed), for: .touchUpInside)
        
        let btnStack = UIStackView(arrangedSubviews: [cancelBtn, confirmBtn])
        btnStack.axis = .horizontal
        btnStack.distribution = .fill
        btnStack.alignment = .fill
        btnStack.spacing = 40
        
        self.addSubview(btnStack)
        btnStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            queueStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            queueStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            queueStack.widthAnchor.constraint(equalToConstant: 250),
            queueStack.heightAnchor.constraint(equalToConstant: 40),
            
            messageLabel.topAnchor.constraint(equalTo: queueStack.bottomAnchor, constant: 30),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            line.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            btnStack.topAnchor.constraint(greaterThanOrEqualTo: line.bottomAnchor, constant: 20),
            btnStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            btnStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            btnStack.heightAnchor.constraint(equalToConstant: 50),
            btnStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 25)

        ])
        
    }
    
    //MARK: - @objc functions
    
    @objc func confirmBtnPressed(){
        if let confirmClosure {
            confirmClosure()
        }
    }
    
    @objc func cancelBtnPressed(){
        if let cancelClosure {
            cancelClosure()
        }

    }
    
}
