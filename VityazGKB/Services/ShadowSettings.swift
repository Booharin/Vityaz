//
//  ShadowSettings.swift
//  VityazGKB
//
//  Created by Александр on 08.04.2018.
//  Copyright © 2018 Александр. All rights reserved.
//
import UIKit

extension UIView {
    func setupShadow() {
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 8, height: 8)
        layer.shadowRadius = 5
    }
}
