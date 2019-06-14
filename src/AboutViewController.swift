/*

 Licensed under the MIT license:

 Copyright (c) 2019 Michal Duda

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 */

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
            urlToShow = URL(string: "https://raw.githubusercontent.com/vookimedlo/dictionary-ios/master/LICENSE")
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
