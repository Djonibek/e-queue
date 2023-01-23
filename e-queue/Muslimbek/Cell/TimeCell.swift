//
//  TimeCell.swift
//  E-Queue
//
//  Created by Muslim on 09/01/23.
//

import UIKit

class TimeCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.systemGray2.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.clipsToBounds = true
    }

}
