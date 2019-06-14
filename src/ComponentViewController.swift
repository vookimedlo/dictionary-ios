//
//  AboutViewController.swift
//  dictionary
//
//  Created by Michal Duda on 08/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class ComponentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        var urlToShow: URL?
        switch sender.view?.tag {
        case 1:
            urlToShow = URL(string: "https://raw.githubusercontent.com/stephencelis/SQLite.swift/master/LICENSE.txt")
        case 2:
            urlToShow = URL(string: "https://github.com/stephencelis/SQLite.swift")
        default:
            debugPrint("Unknown tag", sender.view?.tag ?? "nil")
        }
        
        if let url = urlToShow {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
