//
//  ServicesVC.swift
//  E-Queue
//
//  Created by Muslim on 09/01/23.
//

import UIKit

class ServicesVC: UIViewController {
    
    @IBOutlet var sortBtns: [UIButton]!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        
    }
    
    //MARK: - @IBAction Functions
    
    @IBAction func sortBtnPressed(_ sender: UIButton) {
        showLoader()
        sortBtns.forEach { button in
            button.configuration?.baseForegroundColor = .systemGray
            button.configuration?.baseBackgroundColor = .systemGray6
        }
        
        sender.configuration?.baseBackgroundColor = .link
        sender.configuration?.baseForegroundColor = .white
    }
    
    //MARK: - Setup Functions
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ServiceCell", bundle: nil), forCellReuseIdentifier: "ServiceCell")
        
    }
    
    func setupNavBar(){
        navigationItem.title = "Покупка валюты"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    //MARK: - Functions
    
    func showLoader(){
        
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            loadingIndicator.stopAnimating()
            alert.dismiss(animated: true)
        }
        
    }
}


extension ServicesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell") as! ServiceCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height * 0.17
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BookingVC(nibName: "BookingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
