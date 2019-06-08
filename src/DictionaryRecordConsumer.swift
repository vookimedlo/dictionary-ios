//
//  DictionaryRecordConsumer.swift
//  dictionary
//
//  Created by Michal Duda on 05/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation

protocol DictionaryRecordConsumer {
    func consume(record: DictionaryRecord)
}
