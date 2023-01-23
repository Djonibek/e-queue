//
//  SubcategoryColViewCell.swift
//  E-Queue
//
//  Created by Muslim on 21/01/23.
//

import UIKit

class SubcategoryColViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = UIColor.systemIndigo.withAlphaComponent(0.6).cgColor
        containerView.layer.borderWidth = 1
    }

}
