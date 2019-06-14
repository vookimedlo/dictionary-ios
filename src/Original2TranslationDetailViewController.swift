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

import AVFoundation
import UIKit

class Original2TranslationDetailViewController: BaseDetailViewController {
    
    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordClassLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var pluralLabel: UILabel!
    @IBOutlet weak var translationSayButton: UIButton!
    @IBOutlet weak var originalSayButton: UIButton!
    @IBOutlet weak var pronunciationImage: UIImageView!
    @IBOutlet weak var pronunciationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRecord()
        originalSayButton.isEnabled = RuntimeSettings.isOriginalVoiceAvailable
        translationSayButton.isEnabled = RuntimeSettings.isTranslationVioceAvailable
    }

    private func hidePronunciationWidgetsOnSmallDevices() {
            originalSayButton.isHidden = true
            translationSayButton.isHidden = true
            pronunciationImage.isHidden = true
            pronunciationLabel.isHidden = true
    }

    private func showRecord() {
        show(originalLabelText: &(originalLabel.text!),
             translationLabelText: &(translationLabel.text!),
             wordClassLabelText: &(wordClassLabel.text!),
             categoryLabelText: &(categoryLabel.text!),
             areaLabelText: &(areaLabel.text!),
             pluralLabelText: &(pluralLabel.text!))
    }
}

// MARK: - IBActions

extension Original2TranslationDetailViewController {
    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sayOriginalButtonAction(_ sender: Any) {
        guard let record = record else {
            return
        }

        sayText(say: record.originalText, language: VoiceOverLanguages.englishUS)
    }
    
    @IBAction func sayTranslationButtonAction(_ sender: Any) {
        guard let record = record else {
            return
        }

        sayText(say: record.translation, language: VoiceOverLanguages.czech)
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        tapGestureActionResolver(tag: sender.view?.tag)
    }
}
