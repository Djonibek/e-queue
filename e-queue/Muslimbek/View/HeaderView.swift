//
//  SubcategoryView.swift
//  E-Queue
//
//  Created by Muslim on 21/01/23.
//

import UIKit

class SubcategoryView: UIView {

    
    let btn : UIButton = {
        let b = UIButton()

        b.configuration = .plain()
        b.configuration?.title = "Section"
        b.contentHorizontalAlignment = .fill
        b.configuration?.image = UIImage(systemName: "chevron.right")
        b.configuration?.imagePlacement = .trailing
        b.configuration?.background.strokeColor = UIColor.systemIndigo.withAlphaComponent(0.6)
        b.configuration?.background.strokeWidth = 1
        b.configuration?.cornerStyle = .large
        return b
    }()
    
    var btnClosure : (() -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        btn.frame = frame
        btn.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        
        self.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    @objc func btnPressed(){
        if let btnClosure {
            btnClosure()
        }
    }
}
