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
    
    var clientData = [String: String]()
    
    let annotation = MKPointAnnotation()
    var coordinationOfAnnotation = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.instance.delegate = self
        LocationManager.instance.startUpdateLocation()
        setHelpButton()
    }
    
    @IBAction func getHelp(_ sender: Any) {
        
    }
    
    @IBAction func backToAuth(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func infoButton(_ sender: Any) {
        DispatchQueue.main.async {
            if let kod = self.clientData["kod"],
                let clientName = self.clientData["name"],
                let clientFamily = self.clientData["family"],
                let date = self.clientData["subscribe_finish"] {
                
                let message = "Код Клиента: " + kod + "\n" + "Клиент: " + clientName + " " + clientFamily + "\n" + "Действие услуги до: " + date
                let alert = UIAlertController(title: "UserInfo", message: message, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func setHelpButton() {
        getHelpButton.layer.borderColor = #colorLiteral(red: 0.2431372549, green: 0.2666666667, blue: 0.5960784314, alpha: 1)
        getHelpButton.layer.borderWidth = 4.0
        getHelpButton.titleLabel?.textAlignment = .center
    }
}

extension MapViewController: LocationManagerDelegate, UIGestureRecognizerDelegate {
    
    func locationManager(_ locationManager: LocationManager, coordination: CLLocationCoordinate2D) {
        let currentRadius: CLLocationDistance = 1000
        let currentRegion = MKCoordinateRegionMakeWithDistance(coordination, currentRadius * 2.0, currentRadius * 2.0)
        mapView.setRegion(currentRegion, animated: true)
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true

        annotation.coordinate = coordinationOfAnnotation
        annotation.title = "Я здесь!"
        
        mapView.addAnnotation(annotation)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        mapView.removeAnnotation(annotation)
        let location = gestureReconizer.location(in: mapView)
        coordinationOfAnnotation = mapView.convert(location,toCoordinateFrom: mapView)
        sleep(1)
        mapView.addAnnotation(annotation)
    }
    
}
