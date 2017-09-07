//
//  NextCircleViewController.swift
//  Battle Royale
//
//  Created by Vince Lee on 2017/9/7.
//  Copyright © 2017年 吳得人. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class NextCircleViewController: MapViewController {

   
    var coordinator = CLLocationCoordinate2D()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        let camera = GMSCameraPosition.camera(withLatitude: 25.039016,
                                              longitude: 121.376042,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.settings.myLocationButton = true
        //mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isMyLocationEnabled = true
        
        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
        
        
        
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64).isActive = true
        
        mapView.isHidden = true
        view.addSubview(button)
        
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: mapView.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: mapView.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
     @objc override func setCircle() {
//        let lat = coordinator.latitude
//        let lon = coordinator.longitude
//            let circleCenter = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
            
            circ = GMSCircle(position: coordinator, radius: 50)
            circ.fillColor = UIColor(red:0.35, green:0, blue:0, alpha:0.05)
            circ.strokeColor = .red
            circ.strokeWidth = 5
            circ.map = mapView
            
            
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


