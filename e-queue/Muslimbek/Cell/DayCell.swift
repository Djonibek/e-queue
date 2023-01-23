//
//  DayCell.swift
//  E-Queue
//
//  Created by Muslim on 09/01/23.
//

import UIKit

class DayCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.systemGray2.cgColor
        containerView.clipsToBounds = true
    }

}
