//
//  WebViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://hotline.gkb-vityaz.ru/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func backToMainView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
