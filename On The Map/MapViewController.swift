//
//  MapViewController.swift
//  On The Map
//
//  Created by ROHIT GUPTA on 12/4/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tapPin: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    @IBAction func dropPin(sender: AnyObject) {
        
        // User's location
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Source: http://stackoverflow.com/questions/25296691/swift-get-users-current-location-coordinates
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // print(locations)
        
        var currentLocation : CLLocation = locations[0] as! CLLocation
        
        var longitude = currentLocation.coordinate.longitude
        var latitude = currentLocation.coordinate.latitude
        
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var latitudeDelta : CLLocationDegrees = 0.03
        var longitudeDelta : CLLocationDegrees = 0.03
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latitudeDelta, longitudeDelta)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.mapView.setRegion(region, animated: true)
        
        let myLocation = MKPointAnnotation()
        myLocation.coordinate = location
        mapView.addAnnotation(myLocation)
        
        
        
    }
    

}

/*
func mapLongPress(recognizer: UIGestureRecognizer) {

print("A long press has been detected.")

let touchedAt = recognizer.locationInView(self.mapView)
let touchedAtCoordinate : CLLocationCoordinate2D = mapView.convertPoint(touchedAt, toCoordinateFromView: self.mapView)
let newPin = MKPointAnnotation()
newPin.coordinate = touchedAtCoordinate
mapView.addAnnotation(newPin)

}
*/
