//
//  TicketCell.swift
//  E-Queue
//
//  Created by Muslim on 20/01/23.
//

import UIKit

class TicketCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = UIColor.systemIndigo.withAlphaComponent(0.5).cgColor
        containerView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
