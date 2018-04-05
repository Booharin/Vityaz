//
//  WebViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

final class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backToMainView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
