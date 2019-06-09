//
//  DictionaryRecordPopulate.swift
//  dictionary
//
//  Created by Michal Duda on 04/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation
import SQLite

class DictionaryRecordLoader {
    let databasePath: String// = Bundle.main.path(forResource: "EnCz", ofType: "db")!
    let id = Expression<Int64>("Id")
    let original = Expression<String>("Original")
    let translation = Expression<String>("Translation")
    let notes = Expression<String>("Notes")
    let details = Expression<String>("Details")
    
    init(db bundlePath: String) {
        databasePath = bundlePath
    }
    
    func populate(table: String) -> [DictionaryRecord] {
        var records: [DictionaryRecord] = []
        if let db = try? Connection(databasePath) {
            let chosenTable = Table(table)
            do {
                for record in try db.prepare(chosenTable) {                    
                    records.append(DictionaryRecord(originalText: record[original],
                                                    translation: record[translation],
                                                    notes: record[notes],
                                                    details: record[details]))
                }
            } catch {
                records = []
            }
        }
        
        return records
    }
}
