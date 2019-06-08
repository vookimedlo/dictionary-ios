//
//  En2CzDetailViewController.swift
//  dictionary
//
//  Created by Michal Duda on 02/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import AVFoundation
import UIKit

class En2CzDetailViewController: UIViewController, DictionaryRecordConsumer {
    
    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordClassLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var pluralLabel: UILabel!
    @IBOutlet weak var translationSayButton: UIButton!
    @IBOutlet weak var originalSayButton: UIButton!
    
    var record: DictionaryRecord?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show(record: record)
        if (!RuntimeSettings.isOriginalVoiceAvailable) {
            originalSayButton.isEnabled = false
        }
        
        if (!RuntimeSettings.isTranslationVioceAvailable) {
            translationSayButton.isEnabled = false
        }
    }
    
    func consume(record: DictionaryRecord) {
        self.record = record
    }
    
    private func show(record: DictionaryRecord?) {
        guard let record = record else {
            return
        }

        originalLabel.text = record.originalText
        translationLabel.text = record.translation
        
        let notes = DictionaryRecordNotesParser(record: record)
        wordClassLabel.text = notes.wordClass
        categoryLabel.text = notes.category
        areaLabel.text = notes.area
        pluralLabel.text = notes.plural
    }

}

// MARK: - IBActions

extension En2CzDetailViewController {
    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sayOriginalButtonAction(_ sender: Any) {
        guard let record = record else {
            return
        }

        let utterance = AVSpeechUtterance(string: record.originalText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    @IBAction func sayTranslationButtonAction(_ sender: Any) {
        guard let record = record else {
            return
        }

        let utterance = AVSpeechUtterance(string: record.translation)
        utterance.voice = AVSpeechSynthesisVoice(language: "cs-CZ")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
}
