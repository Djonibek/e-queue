//
//  ConfirmBottomSheet.swift
//  E-Queue
//
//  Created by Muslim on 09/01/23.
//

import UIKit

class ConfirmBottomSheet: UIViewController {
    
    @IBOutlet weak var ticketView: TicketView!
    @IBOutlet weak var confirmView: ConfirmView!
    
    var isConfirm = true
    var delegate: BottomSheetDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isConfirm {
            confirmView.isHidden = false
            ticketView.isHidden = true
        }else {
            confirmView.isHidden = true
            ticketView.isHidden = false
        }
    }
    
    
    
    
    //MARK: - Setup Functions
    
    func setupSubViews(){
        
        confirmView.confirmClosure = { [self] in
            delegate?.openTicketBottomSheet()
        }
        confirmView.cancelClosure = { [self] in
            dismiss(animated: true)
        }
        
        ticketView.infoClosure = { [self] in
            delegate?.pushInfoVC()
        }
        
        ticketView.backClosure = { [self] in
            dismiss(animated: true)
        }
        
    }
    
    
}
