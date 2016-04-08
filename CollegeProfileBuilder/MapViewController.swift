//
//  MapViewController.swift
//  CollegeProfileBuilder
//
//  Created by student1 on 4/1/16.
//  Copyright © 2016 John Hersey High school. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var passData3 = college()
    let setLocation = CLGeocoder()
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocation.geocodeAddressString(passData3.location) { (placeMark, error) in
            let latitude = placeMark![0].location?.coordinate.latitude
            let longitude = placeMark![0].location?.coordinate.longitude
            let coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
            self.annotation.coordinate = coordinate
            self.annotation.title = self.passData3.location
            self.mapView.addAnnotation(self.annotation)
        }
        let sheet = UIAlertController(title: passData3.location, message: nil, preferredStyle: .ActionSheet)
        sheet.popoverPresentationController?.sourceView = self.view
        sheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width , height: 100)
        //presentViewController(sheet, animated: true, completion: nil)
    }
    
    
}
