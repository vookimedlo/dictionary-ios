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
