//
//  UIDevice.swift
//  dictionary
//
//  Created by Michal Duda on 11/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

extension UIDevice {
    var platform: String {
        get {
            var size = 0
            sysctlbyname("hw.machine", nil, &size, nil, 0)
            var machine = [CChar](repeating: 0,  count: size)
            sysctlbyname("hw.machine", &machine, &size, nil, 0)
            return String(cString: machine)
        }
    }
}
