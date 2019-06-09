//
//  RuntimeSettingsProtocol.swift
//  dictionary
//
//  Created by Michal Duda on 09/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation

protocol RuntimeSettingsProtocol {
    static var originalLanguage: VoiceOverLanguages {get set}
    static var translationLanguage: VoiceOverLanguages {get set}
    static var isOriginalVoiceAvailable: Bool {get set}
    static var isTranslationVioceAvailable: Bool {get set}
    static var dictionaryDatabase: String {get set}
    static var databaseOriginal2TranslationTable: String {get set}
    static var databaseTranslation2OriginalTable: String {get set}
}
