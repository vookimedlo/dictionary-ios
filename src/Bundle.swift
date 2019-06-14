//
//  Bundle.swift
//  dictionary
//
//  Created by Michal Duda on 14/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import Foundation

extension Bundle {
    static func bundleVersion() -> (version: String, build: String) {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ("", "")
        }
        guard let version = dictionary["CFBundleShortVersionString"]  as? String else {
            return ("", "")
        }
        guard let build = dictionary[kCFBundleVersionKey as String] as? String else {
            return (version, "")
        }
        return (version, build)
    }
}
