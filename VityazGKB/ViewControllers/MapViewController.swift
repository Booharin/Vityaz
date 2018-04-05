//
//  MapViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getHelp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backToAuth(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
