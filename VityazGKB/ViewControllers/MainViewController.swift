//
//  ViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backGroundColor"))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func becomeClient(_ sender: Any) {
        if let vc = UIStoryboard(name: "WebView",
                                 bundle: nil)
            .instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func enter(_ sender: Any) {
        if let vc = UIStoryboard(name: "Auth",
                                 bundle: nil)
            .instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
}

