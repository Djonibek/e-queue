//
//  TicketInfoVC.swift
//  E-Queue
//
//  Created by Muslim on 20/01/23.
//

import UIKit

class TicketInfoVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupNavBar()
    }
    
    //MARK: - Setup Functions
    
    func setupNavBar(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.title = "Просмотр талона"
    }
    
    
    func setupSubviews(){
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = UIColor.systemIndigo.withAlphaComponent(0.6).cgColor
        containerView.layer.borderWidth = 1
    }
    
    //MARK: - @IBAction functions
    
    
    @IBAction func cancelTicketBtnPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
