//
//  ServiceCell.swift
//  E-Queue
//
//  Created by Muslim on 09/01/23.
//

import UIKit

class ServiceCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor.link.withAlphaComponent(0.7).cgColor
        containerView.layer.borderWidth = 0.75
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
