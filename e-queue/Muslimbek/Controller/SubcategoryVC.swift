//
//  SubcategoryVC.swift
//  E-Queue
//
//  Created by Muslim on 21/01/23.
//

import UIKit

class SubcategoryVC: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var hiddenSection = Set<Int>()

    var rowData = [[1], [1], [1], [1], [1]]
    var sectionData = ["a", "b", "c", "d", "e"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()
        setupTextField()
    }

    
    func setupTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "SubcategoryTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "SubcategoryTableViewCell")
        
        for i in 0...sectionData.count {
            hiddenSection.insert(i)
        }
    }
    
    func setupTextField(){
        
        textField.placeholder = "Search"
        
        let container = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 45,
                                        height: 40))
        let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.frame = CGRect(x: 0,
                                               y: 0,
                                               width: 60,
                                               height: 40)
        imageView.contentMode = .center
        container.addSubview(imageView)
        
        textField.leftViewMode = .always
        textField.leftView = container
    }
    
    func setupNavBar(){
        navigationItem.title = "Банковские услуги"
    }

}

extension SubcategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSection.contains(section){
            return 0
        }
        return rowData[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SubcategoryView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: tableView.frame.width,
                                                   height: 50))
        header.btn.configuration?.title = sectionData[section]
        header.btnClosure = {
            header.btn.tag = section
            self.headerBtnPressed(header.btn)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubcategoryTableViewCell") as! SubcategoryTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func headerBtnPressed(_ sender: UIButton){
        let section = sender.tag
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            for row in 0..<self.rowData[section].count {
                indexPaths.append(IndexPath(row: row, section: section))
                }
            return indexPaths
        }
        
        if hiddenSection.contains(section){
            self.hiddenSection.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(), with: .fade)
        }else{
            self.hiddenSection.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(), with: .fade)
        }
    }
    
}
