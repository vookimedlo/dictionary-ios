//
//  BaseDetailViewController.swift
//  dictionary
//
//  Created by Michal Duda on 09/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import AVFoundation
import UIKit

class BaseDetailViewController: UIViewController, DictionaryRecordConsumer {

    var record: DictionaryRecord?
    
    func consume(record: DictionaryRecord) {
        self.record = record
    }
    
    func sayText(say text: String, language: VoiceOverLanguages) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language.rawValue)
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    func show( originalLabelText: inout String,
               translationLabelText: inout String,
               wordClassLabelText: inout String,
               categoryLabelText: inout String,
               areaLabelText: inout String,
               pluralLabelText: inout String) {
        guard let record = record else {
            return
        }
        
        originalLabelText = record.originalText
        translationLabelText = record.translation
        
        let notes = DictionaryRecordNotesParser(record: record)
        wordClassLabelText = notes.wordClass
        categoryLabelText = notes.category
        areaLabelText = notes.area
        pluralLabelText = notes.plural
    }
    
    func tapGestureActionResolver(tag: Int?) {
        guard let record = record else {
            return
        }
        
        switch tag {
        case 1:
            UIPasteboard.general.string = record.originalText
            showToast(message: NSLocalizedString("in clipboard", comment: "shown toast on text storing into the clipboard"))
        case 2:
            UIPasteboard.general.string = record.translation
            showToast(message: NSLocalizedString("in clipboard", comment: "shown toast on text storing into the clipboard"))
        default:
            debugPrint("Unknown tag", tag ?? "nil")
        }
    }
}
