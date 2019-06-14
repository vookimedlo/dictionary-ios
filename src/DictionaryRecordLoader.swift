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
