//
//  MapViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var getHelpButton: UIButton!
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    private let getHelpButtonWidth: CGFloat = 148
    private let questionButtonWidth: CGFloat = 46
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.instance.delegate = self
        LocationManager.instance.startUpdateLocation()
    }
    
    @IBAction func getHelp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backToAuth(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension MapViewController: LocationManagerDelegate {
    func locationManager(_ locationManager: LocationManager, coordination: CLLocationCoordinate2D) {
        let currentRadius: CLLocationDistance = 1000
        let currentRegion = MKCoordinateRegionMakeWithDistance(coordination, currentRadius * 2.0, currentRadius * 2.0)
        mapView.setRegion(currentRegion, animated: true)
        mapView.showsUserLocation = true
    }
}
