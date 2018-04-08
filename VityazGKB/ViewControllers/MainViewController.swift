//
//  ViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var becomeClientButton: UIButton!
    @IBOutlet weak var enterForClientView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backGroundColor"))
        setMainButtons()
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
    
    private func setMainButtons() {
        becomeClientButton.setupShadow()
        enterForClientView.setupShadow()
    }
}

