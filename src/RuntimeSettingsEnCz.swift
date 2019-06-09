//
//  RuntimeSettings.swift
//  dictionary
//
//  Created by Michal Duda on 06/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation

struct RuntimeSettings: RuntimeSettingsProtocol {
    static var originalLanguage: VoiceOverLanguages = .englishUS
    static var translationLanguage: VoiceOverLanguages = .czech
    static var isOriginalVoiceAvailable: Bool = false
    static var isTranslationVioceAvailable: Bool = false
    static var dictionaryDatabase: String = "EnCz"
    static var databaseOriginal2TranslationTable: String = "en-cs"
    static var databaseTranslation2OriginalTable: String = "cs-en"

}
