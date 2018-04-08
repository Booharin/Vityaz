//
//  AuthViewController.swift
//  VityazGKB
//
//  Created by Александр on 05.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {

    @IBOutlet weak var kodOfClientView: UITextField!
    @IBOutlet weak var passwordView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toMap(_ sender: Any) {
        checkClientPassword()
    }
    
    @IBAction func backToMain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func checkClientPassword() {
        
        if let baseURL = URL(string: "http://airwan.ru/api.php"),
            let id = kodOfClientView.text,
            let pass = passwordView.text {
        var request = URLRequest(url: baseURL)
            request.setValue("application/x-www-form-urlencoded",
                             forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            let postString = "method=auth&password=" + pass + "&user_id=" + id
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    guard let myJson = json else { return }
                    guard let result = myJson["result"] as? Bool else { return }
                    if result == false {
                        DispatchQueue.main.async {
                            if let message = myJson["err_msg"] as? String {
                                let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    } else {
                        var dict = [String: String]()
                        guard let name = myJson["name"] as? String else { return }
                        dict["name"] = name
                        guard let family = myJson["family"] as? String else { return }
                        dict["family"] = family
                        guard let subscribe_finish = myJson["subscribe_finish"] as? String else { return }
                        dict["subscribe_finish"] = subscribe_finish
                        guard let token = myJson["token"] as? String else { return }
                        dict["token"] = token
                        
                        DispatchQueue.main.async {
                            if let kod = self.kodOfClientView.text {
                                dict["kod"] = kod
                            }
                            self.presentMapViewController(dict)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    private func presentMapViewController(_ dict: [String: String]) {
        if let vc = UIStoryboard(name: "Map",
                                 bundle: nil)
            .instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        {
            vc.clientData = dict
            present(vc, animated: true, completion: nil)
        }
    }
    
}
