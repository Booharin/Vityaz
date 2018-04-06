//
//  LocationManager.swift
//  VityazGKB
//
//  Created by Александр on 06.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import CoreLocation

protocol LocationManagerDelegate: class {
    func locationManager(_ locationManager: LocationManager, coordination: CLLocationCoordinate2D)
}

class LocationManager: NSObject {
    static let instance = LocationManager()
    let geoCoder = CLGeocoder()
    private override init(){}
    
    weak var delegate: LocationManagerDelegate?
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
    func startUpdateLocation() {
       locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationManager(self, coordination: locations[0].coordinate)
        guard let location = locations.last else { return }
        geoCoder.reverseGeocodeLocation(location) { mark, error in
            
        }
    }
}
