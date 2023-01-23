//
//  AllTicketsVC.swift
//  E-Queue
//
//  Created by Muslim on 20/01/23.
//

import UIKit

class AllTicketsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()
    }
    
    func setupNavBar(){
        navigationItem.title = "Электронные талоны"
    }

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(
            UINib(nibName: "TicketCell",
                  bundle: nil),
            forCellReuseIdentifier: "TicketCell")
        
    }
    
}

extension AllTicketsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell") as! TicketCell
        
        return cell
    }
}
