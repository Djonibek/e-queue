//
//  MapVC.swift
//  E-Queue
//
//  Created by Muslim on 18/01/23.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var coordinate: CLLocationCoordinate2D? = CLLocationCoordinate2D(latitude: 41.31040184354587,
                                                                     longitude: 69.27612567694293)
    override func viewDidLoad() {
        super.viewDidLoad()

        centerMapView()
        showPoint()
        
    }
    
    //MARK: - @IBAction Funtions
    
    
    @IBAction func directionBtnPressed(_ sender: UIButton) {
        
        OpenMapDirections.present(in: self,
                                  sourceView: sender,
                                  title: "Bank",
                                  coordinate: coordinate!)
    }
    
    
    //MARK: - Functions
    func centerMapView(){
        if let coor = coordinate {
            let region = MKCoordinateRegion(center: coor,
                                            latitudinalMeters: 1000,
                                            longitudinalMeters: 1000)
            mapView.region = region
        }
        
    }

    func showPoint(){
        
        let point = MKPointAnnotation()
        
        point.title = "Bank"
        point.subtitle = "Kapital Bank"
        if let coor = coordinate {
            point.coordinate = coor
        }
        
        mapView.addAnnotation(point)
    }

}
