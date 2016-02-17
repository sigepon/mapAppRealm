//
//  DetailViewController.swift
//  masterDetailOrigin
//
//  Created by 菊池 重夫 on 2016/02/17.
//  Copyright © 2016年 sigepon. All rights reserved.
//

import UIKit
import RealmSwift
import MapKit
import CoreLocation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var inputNameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    let dataArray = try! Realm().objects(Model)
    
    let realm = try! Realm()
    var detailItem: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true

        if let detail = self.detailItem{
            let lat = detail.valueForKey("latitude") as! Double
            let lng = detail.valueForKey("longitude") as! Double
            
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2DMake(lat, lng)
            mapView.addAnnotation(pin)
        }
    }

    @IBAction func addNew(sender: AnyObject) {
        let realmDB = Model()
        
        if dataArray.count != 0 {
            realmDB.id = self.dataArray.max("id")! + 1
        }
        
        try! realm.write{
            realmDB.name = nameTextField.text!
            realmDB.latitude = mapView.centerCoordinate.latitude
            realmDB.longitude = mapView.centerCoordinate.longitude
            realm.add(realmDB, update: true)
        }
        
        navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func tapInput(sender: UIButton) {
        inputNameView.hidden = false
    }
}
