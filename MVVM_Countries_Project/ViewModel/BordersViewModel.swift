//
//  BordersViewModel.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class BordersViewModel {
    
    var country: Country
    var borders: [Border] = [Border]()
    var searchTerm: String = ""
    
    init(country: Country) {
        self.country = country
        
        if let bordersCode = country.borders {
            for border in bordersCode {
                if bordersCode.last != border {
                    searchTerm += "\(border);"
                } else {
                    searchTerm += "\(border)"
                }
            }
        }
    }
    
    
    func fetchBorders(_ completion: @escaping (_ countries: [Border]?, _ error: Error?) -> Void) {
        
    ServiceManager.shared.fetchBorders(searchTerm: searchTerm) { (borders, error) in
        
        if let error = error {
            completion(nil, error)
        }
        
        guard let borders = borders else { return }
        self.borders = borders
        completion(borders, nil)
        }
    }
}
