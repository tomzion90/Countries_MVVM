//
//  Country.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

struct Country: Decodable, Comparable {
    var name: String
    var nativeName: String?
    var area: CGFloat?
    
    var borders: [String]?
    
    static func < (lhs: Country, rhs: Country) -> Bool {
        return lhs.area ?? 0 > rhs.area ?? 0
    }
}


