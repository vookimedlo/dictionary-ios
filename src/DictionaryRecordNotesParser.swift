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

import Foundation

class DictionaryRecordNotesParser {
    static let wordClassMapping: [String: String] = ["n:": NSLocalizedString("nouns", comment: "word class: nouns"),
                                                     "adj:": NSLocalizedString("adjectives", comment: "word class: adjectives"),
                                                     "pron:": NSLocalizedString("pronouns", comment: "word class: pronouns"),
                                                     "num:": NSLocalizedString("numerals", comment: "word class: numerals"),
                                                     "v:": NSLocalizedString("verbs", comment: "word class: verbs"),
                                                     "adv:": NSLocalizedString("adverbs", comment: "word class: adverbs"),
                                                     "prep:": NSLocalizedString("prepositions", comment: "word class: prepositions"),
                                                     "conj:": NSLocalizedString("conjunctions", comment: "word class: conjunctions"),
                                                     "interj:": NSLocalizedString("interjections", comment: "word class: interjections")]

    static let categoryMapping = ["[bás.]": NSLocalizedString("poeticism", comment: "word category: poeticism"),
                                  "[dět.]": NSLocalizedString("childish", comment: "word category: childish"),
                                  "[fráz.]": NSLocalizedString("phrase", comment: "word category: phrase"),
                                  "[frsl.]": NSLocalizedString("phrasal verb", comment: "word category: phrasal verb"),
                                  "[hovor.]": NSLocalizedString("colloquially", comment: "word category: colloquially"),
                                  "[id.]": NSLocalizedString("idiom", comment: "word category: idiom"),
                                  "[jmén.]": NSLocalizedString("proper name", comment: "word category: proper name"),
                                  "[kniž.]": NSLocalizedString("literary", comment: "word category: literary"),
                                  "[neobv.]": NSLocalizedString("uncommon", comment: "word category: uncommon"),
                                  "[neprav.]": NSLocalizedString("irregular verb", comment: "word category: irregular verb"),
                                  "[obec.]": NSLocalizedString("generic", comment: "word category: generic"),
                                  "[přen.]": NSLocalizedString("metaphorically", comment: "word category: metaphorically"),
                                  "[slang.]": NSLocalizedString("slangily", comment: "word category: slangily"),
                                  "[vulg.]": NSLocalizedString("vulgarism", comment: "word category: vulgarism"),
                                  "[zast.]": NSLocalizedString("old use, archaic", comment: "word category: old use, archaic"),
                                  "[zkr.]": NSLocalizedString("abbreviation", comment: "word category: abbreviation"),
                                  "[žert.]": NSLocalizedString("jokingly", comment: "word category: jokingly"),
                                  "[amer.]": NSLocalizedString("American", comment: "word category: American"),
                                  "[aus.]": NSLocalizedString("Australian", comment: "word category: Australian"),
                                  "[brit.]": NSLocalizedString("British", comment: "word category: British"),
                                  "[skot.]": NSLocalizedString("Scottish", comment: "word category: Scottish")]

    static let areaMapping = ["[fin.]": NSLocalizedString("finance", comment: "word area: finance"),
                              "[hist.]": NSLocalizedString("historical expression or name", comment: "word area: historical expression or name"),
                              "[hud.]": NSLocalizedString("musical terminology", comment: "word area: musical terminology"),
                              "[lingv.]": NSLocalizedString("linguistic", comment: "word area: linguistic"),
                              "[myt.]": NSLocalizedString("mythological", comment: "word area: mythological"),
                              "[náb.]": NSLocalizedString("word related to religion", comment: "word area: word related to religion"),
                              "[polit.]": NSLocalizedString("political expression", comment: "word area: political expression"),
                              "[práv.]": NSLocalizedString("legal", comment: "word area: legal"),
                              "[psych.]": NSLocalizedString("psychological", comment: "word area: psychological"),
                              "[sex.]": NSLocalizedString("sexual expression", comment: "word area: sexual expression"),
                              "[sport.]": NSLocalizedString("sport related locution", comment: "word area: sport related locution"),
                              "[astr.]": NSLocalizedString("astronomy", comment: "word area: astronomy"),
                              "[bio.]": NSLocalizedString("biology", comment: "word area: biology"),
                              "[bot.]": NSLocalizedString("botany", comment: "word area: botany"),
                              "[eko.]": NSLocalizedString("ecology", comment: "word area: ecology"),
                              "[fyz.]": NSLocalizedString("physics", comment: "word area: physics"),
                              "[geod.]": NSLocalizedString("geodesy", comment: "word area: geodesy"),
                              "[geol.]": NSLocalizedString("geology", comment: "word area: geology"),
                              "[chem.]": NSLocalizedString("chemistry", comment: "word area: chemistry"),
                              "[mat.]": NSLocalizedString("mathematics", comment: "word area: mathematics"),
                              "[med.]": NSLocalizedString("medical term", comment: "word area: medical term"),
                              "[meteo.]": NSLocalizedString("meteorology", comment: "word area: meteorology"),
                              "[opt.]": NSLocalizedString("optics", comment: "word area: optics"),
                              "[zem.]": NSLocalizedString("geography", comment: "word area: geography"),
                              "[zoo.]": NSLocalizedString("zoology", comment: "word area: zoology"),
                              "[cukr.]": NSLocalizedString("sugar industry", comment: "word area: sugar industry"),
                              "[dřev.]": NSLocalizedString("wood industry", comment: "word area: wood industry"),
                              "[el.]": NSLocalizedString("electrical engineering", comment: "word area: electrical engineering"),
                              "[horn.]": NSLocalizedString("mining, mineralogy", comment: "word area: mining, mineralogy"),
                              "[hut.]": NSLocalizedString("metallurgy", comment: "word area: metallurgy"),
                              "[it.]": NSLocalizedString("information technology", comment: "word area: information technology"),
                              "[jad.]": NSLocalizedString("nuclear physics, technology", comment: "word area: nuclear physics, technology"),
                              "[ker.]": NSLocalizedString("ceramic industry", comment: "word area: ceramic industry"),
                              "[kož.]": NSLocalizedString("tanning industry", comment: "word area: tanning industry"),
                              "[lak.]": NSLocalizedString("coating technology", comment: "word area: coating technology"),
                              "[potr.]": NSLocalizedString("food processing", comment: "word area: food processing"),
                              "[stav.]": NSLocalizedString("building industry, architecture", comment: "word area: building industry, architecture"),
                              "[tech.]": NSLocalizedString("technical domain", comment: "word area: technical domain"),
                              "[text.]": NSLocalizedString("textile industry", comment: "word area: textile industry"),
                              "[voj.]": NSLocalizedString("military terminology", comment: "word area: military terminology"),
                              "[zeměděl.]": NSLocalizedString("term from the field of agriculture", comment: "word area: term from the field of agriculture"),
                              "[aut.]": NSLocalizedString("automotive industry", comment: "word area: automotive industry"),
                              "[let.]": NSLocalizedString("aviation", comment: "word area: aviation"),
                              "[lod.]": NSLocalizedString("boats, shipping", comment: "word area: boats, shipping"),
                              "[žel.]": NSLocalizedString("railway transport", comment: "word area: railway transport")]

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
            if internalWordClass == nil {
                internalWordClass = DictionaryRecordNotesParser.wordClassMapping[note]
            }
            if let value = DictionaryRecordNotesParser.categoryMapping[note] {
                internalCategory.append(value)
            }
            if let value = DictionaryRecordNotesParser.areaMapping[note] {
                internalArea.append(value)
            }
            if internalPlural == nil && "pl." == note {
                internalPlural = NSLocalizedString("yes", comment: "is plural?")
            }
        }

        wordClass = internalWordClass ?? NSLocalizedString("not specified", comment: "word class is not specified")
        category = ArrayResolver.resolve(first: internalCategory,
                                         second: NSLocalizedString("generic",
                                                                   comment: "word category: generic")).joined(separator: ", ")
        area = ArrayResolver.resolve(first: internalArea,
                                     second: NSLocalizedString("not specified",
                                                               comment: "area is not specified")).joined(separator: ", ")
        plural = internalPlural ?? NSLocalizedString("no", comment: "is plural?")
    }
}
