//
//  Toast.swift
//  dictionary
//
//  Created by Michal Duda on 09/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

// https://stackoverflow.com/a/35130932/3930651
extension UIViewController {
    func showToast(message: String, font: UIFont? = UIFont(name: "Montserrat-Light", size: 12.0)) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width / 2 - 75, y: view.frame.size.height - 100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = font
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
} }
