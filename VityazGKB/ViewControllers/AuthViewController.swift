//
//  AuthViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func toMap(_ sender: Any) {
        if let vc = UIStoryboard(name: "Map",
                                 bundle: nil)
            .instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func backToMain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
