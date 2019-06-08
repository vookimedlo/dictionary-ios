//
//  DictionaryRecordNotesParser.swift
//  dictionary
//
//  Created by Michal Duda on 08/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation

class DictionaryRecordNotesParser {
    
    static let wordClassMapping: [String: String] = ["n:":"nouns",
                                   "adj:":"adjectives",
                                   "pron:":"pronouns",
                                   "num:":"numerals",
                                   "v:":"verbs",
                                   "adv:":"adverbs",
                                   "prep:":"prepositions",
                                   "conj:":"conjunctions",
                                   "interj:":"interjections"]
    
    static let categoryMapping = ["[bás.]":"poeticism",
                                  "[dět.]":"childish",
                                  "[fráz.]":"phrase",
                                  "[frsl.]":"phrasal verb (e.g., give up)",
                                  "[hovor.]":"colloquially",
                                  "[id.]":"idiom (e.g., a bun in the oven)",
                                  "[jmén.]":"proper name",
                                  "[kniž.]":"literary",
                                  "[neobv.]":"uncommon",
                                  "[neprav.]":"irregular verb",
                                  "[obec.]":"generic",
                                  "[přen.]":"metaphorically",
                                  "[slang.]":"slangily",
                                  "[vulg.]":"vulgarism",
                                  "[zast.]":"old use, archaic",
                                  "[zkr.]":"abbreviation",
                                  "[žert.]":"jokingly",
                                  "[amer.]":"American",
                                  "[aus.]":"Australian",
                                  "[brit.]":"British",
                                  "[skot.]":"Scottish"]
    
    static let areaMapping = ["[fin.]":"finance",
                              "[hist.]":"historical expression or name",
                              "[hud.]":"musical terminology",
                              "[lingv.]":"linguistic",
                              "[myt.]":"mythological",
                              "[náb.]":"word related to religion",
                              "[polit.]":"political expression",
                              "[práv.]":"legal",
                              "[psych.]":"psychological",
                              "[sex.]":"sexual expression",
                              "[sport.]":"sport related locution",
                              "[astr.]":"astronomy",
                              "[bio.]":"biology",
                              "[bot.]":"botany",
                              "[eko.]":"ecology",
                              "[fyz.]":"physics",
                              "[geod.]":"geodesy",
                              "[geol.]":"geology",
                              "[chem.]":"chemistry",
                              "[mat.]":"mathematics",
                              "[med.]":"medical term",
                              "[meteo.]":"meteorology",
                              "[opt.]":"optics",
                              "[zem.]":"geography",
                              "[zoo.]":"zoology",
                              "[cukr.]":"sugar industry",
                              "[dřev.]":"wood industry",
                              "[el.]":"electrical engineering",
                              "[horn.]":"mining, mineralogy",
                              "[hut.]":"metallurgy",
                              "[it.]":"information technology",
                              "[jad.]":"nuclear physics, technology",
                              "[ker.]":"ceramic industry",
                              "[kož.]":"tanning industry",
                              "[lak.]":"coating technology",
                              "[potr.]":"food processing",
                              "[stav.]":"building industry, architecture",
                              "[tech.]":"technical domain",
                              "[text.]":"textile industry",
                              "[voj.]":"military terminology",
                              "[zeměděl.]":"term from the field of agriculture",
                              "[aut.]":"automotive industry",
                              "[let.]":"aviation",
                              "[lod.]":"boats, shipping",
                              "[žel.]":"railway transport"]

    let record: DictionaryRecord
    let wordClass: String
    let category: String
    let area: String
    let plural: String
    
    init(record: DictionaryRecord) {
        self.record = record
        let notes: [String] = self.record.notes.lowercased().components(separatedBy: " ")
        var internalWordClass: String?
        var internalCategory: [String] = [String]()
        var internalArea: [String] = [String]()
        var internalPlural: String?
        
        for note in notes {
            if (internalWordClass == nil) {
                internalWordClass = DictionaryRecordNotesParser.wordClassMapping[note]
            }
            if let value = DictionaryRecordNotesParser.categoryMapping[note] {
                internalCategory.append(value)
            }
            if let value = DictionaryRecordNotesParser.areaMapping[note] {
                internalArea.append(value)
            }
            if (internalPlural == nil && "pl." == note) {
                internalPlural = "yes"
            }
        }
        
        wordClass = internalWordClass ?? "not specified"
        category = ArrayResolver.resolve(first: internalCategory, second: "generic").joined(separator: ", ")
        area = ArrayResolver.resolve(first: internalArea, second: "not specified").joined(separator: ", ")
        plural = internalPlural ?? "no"
    }
}
