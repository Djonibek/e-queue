//
//  SubcategoryTableViewCell.swift
//  E-Queue
//
//  Created by Muslim on 21/01/23.
//

import UIKit

class SubcategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var colView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupColView()
    }
    
    func setupColView(){
        
        colView.delegate = self
        colView.dataSource = self
        colView.register(UINib(nibName:"SubcategoryColViewCell",
                               bundle: nil),
                         forCellWithReuseIdentifier: "SubcategoryColViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension SubcategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "SubcategoryColViewCell",
                                               for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 10
        let heigth = (collectionView.frame.height / 2) - 10
        
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
