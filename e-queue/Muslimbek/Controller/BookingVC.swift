//
//  BookingVC.swift
//  E-Queue
//
//  Created by Muslim on 09/01/23.
//

import UIKit

protocol BottomSheetDelegate {
    func openTicketBottomSheet()
    func pushInfoVC()
}

class BookingVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var daysColView: UICollectionView!
    @IBOutlet weak var timeColView: UICollectionView!
    @IBOutlet weak var confirmBtn: UIButton!
    
    var isBooking = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupSubviews()
        setupCollectionView()
        setupNewOrOld()
    }

    //MARK: - @IBActions
    
    @IBAction func likeBtnPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.configuration?.image = UIImage(systemName: "heart.fill")
        } else {
            sender.tag = 0
            sender.configuration?.image = UIImage(systemName: "heart")
        }
    }
    
    @IBAction func locationBtnPressed(_ sender: Any) {
        let vc = MapVC(nibName: "MapVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        showConfirmBottomSheet()
    }
    
    
    
    //MARK: - Setup Functions
    
    func setupNavBar(){
        navigationItem.title = "Онлайн запись"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    func setupCollectionView(){
        daysColView.delegate = self
        daysColView.dataSource = self
        daysColView.register(UINib(nibName: "DayCell", bundle: nil), forCellWithReuseIdentifier: "DayCell")
        
        
        timeColView.delegate = self
        timeColView.dataSource = self
        timeColView.register(UINib(nibName: "TimeCell", bundle: nil), forCellWithReuseIdentifier: "TimeCell")
    }
    func setupSubviews(){
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
    }
    
    func setupNewOrOld(){
        if isBooking {
            
        } else {
            
        }
    }
    
    //MARK: - Functions
    
    let bottomSheet = ConfirmBottomSheet(nibName: "ConfirmBottomSheet", bundle: nil)
    
    func showConfirmBottomSheet(){
        
        bottomSheet.delegate = self
        bottomSheet.isConfirm = true
        if let sheet = bottomSheet.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        present(bottomSheet, animated: true)
    }
    
    func showTicketBottomSheet(){
        
        bottomSheet.delegate = self
        bottomSheet.isConfirm = false
        if let sheet = bottomSheet.sheetPresentationController {
            sheet.detents = [.large()]
        }
        
        present(bottomSheet, animated: true)
        
    }
    
    
}

extension BookingVC: BottomSheetDelegate {
    func openTicketBottomSheet() {
        bottomSheet.dismiss(animated: true)
        showTicketBottomSheet()
        
    }
    
    func pushInfoVC(){
        bottomSheet.dismiss(animated: true)
        let vc = TicketInfoVC(nibName: "TicketInfoVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension BookingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == daysColView {
            return 12
        } else {
            return 18
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == daysColView {
            let cell = daysColView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as! DayCell
            
            return cell
        } else {
            let cell = timeColView.dequeueReusableCell(withReuseIdentifier: "TimeCell", for: indexPath) as! TimeCell
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == daysColView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == daysColView {
            
            let width = daysColView.frame.height
            let height = daysColView.frame.height
            
            return CGSize(width: width, height: height)
            
        } else {
            
            let width: CGFloat = timeColView.frame.width / 3 - 10
            let height: CGFloat = 40
            
            return CGSize(width: width, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == timeColView {
            return CGFloat(10)
        } else {
            return .zero
        }
    }
}
