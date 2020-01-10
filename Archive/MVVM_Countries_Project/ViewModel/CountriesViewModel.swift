//
//  CountriesViewModel.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class CountriesViewModel {
    
    var countries = [Country]()
    typealias complition = (() -> Void)
    
    func fetchCountries(_ completion: @escaping (_ countries: [Country]?, _ error: Error?) -> Void) {
        ServiceManager.shared.fetchData { (countries, error) in
            guard let countries = countries else { return }
            self.countries = countries
            completion(countries, error)
        }
    }
}
