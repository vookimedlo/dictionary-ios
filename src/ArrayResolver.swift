//
//  ArrayResolver.swift
//  dictionary
//
//  Created by Michal Duda on 08/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation

class ArrayResolver {
    static func resolve<T>(first: [T], second: T) -> [T] {
        return first.isEmpty ? [second] : first
    }

    static func resolve<T>(first: [T], second: [T]) -> [T] {
        return first.isEmpty ? second : first
    }
}
