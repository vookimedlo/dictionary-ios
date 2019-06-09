//
//  En2CzDetailViewController.swift
//  dictionary
//
//  Created by Michal Duda on 02/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import AVFoundation
import UIKit

class Translation2OriginalDetailViewControllerDetailViewController: BaseDetailViewController {
    
    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordClassLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var pluralLabel: UILabel!

    @IBOutlet weak var translationSayButton: UIButton!
    @IBOutlet weak var originalSayButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        showRecord()
        originalSayButton.isEnabled = RuntimeSettings.isOriginalVoiceAvailable
        translationSayButton.isEnabled = RuntimeSettings.isTranslationVioceAvailable
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

extension Translation2OriginalDetailViewControllerDetailViewController {
    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sayOriginalButtonAction(_ sender: Any) {
        guard let record = record else {
            return
        }
        
        sayText(say: record.originalText, language: VoiceOverLanguages.czech)
    }
    
    @IBAction func sayTranslationButtonAction(_ sender: Any) {
        guard let record = record else {
            return
        }
        
        sayText(say: record.translation, language: VoiceOverLanguages.englishUS)
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        tapGestureActionResolver(tag: sender.view?.tag)
    }
}
