//
//  ProfileVC.swift
//  E-Queue
//  arrow.right.to.line
//  chevron.right
//  Created by Muslim on 20/01/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
    }
    
    //MARK: - Setup Functions
    
    func setupNavBar(){
        navigationItem.title = "Профиль"
    }
    func setupTableView(){
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .zero
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 5))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Личные данные"
        
        let image = UIImage(systemName: "chevron.right")
        cell.accessoryView = UIImageView(image: image)
        cell.selectionStyle = .none
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.systemIndigo.withAlphaComponent(0.6).cgColor
        cell.layer.borderWidth = 1
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
}
