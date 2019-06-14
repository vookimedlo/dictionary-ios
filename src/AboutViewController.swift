//
//  AboutViewController.swift
//  dictionary
//
//  Created by Michal Duda on 08/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var versionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let version = Bundle.bundleVersion()
        versionLabel.text = "v" + version.version
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        var urlToShow: URL?
        switch sender.view?.tag {
        case 1:
            // TODO: add license url
            urlToShow = URL(string: "https://github.com/vookimedlo/dictionary-ios")
        case 2:
            urlToShow = URL(string: "https://github.com/vookimedlo/dictionary-ios")
        case 3:
            urlToShow = URL(string: "https://raw.githubusercontent.com/svobodneslovniky/svobodneslovniky/master/en-cs/LICENCE")
        case 4:
            urlToShow = URL(string: "https://github.com/svobodneslovniky/svobodneslovniky")
        default:
            debugPrint("Unknown tag", sender.view?.tag ?? "nil")
        }
        
        if let url = urlToShow {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
