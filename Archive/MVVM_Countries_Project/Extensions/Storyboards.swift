//
//  Storyboards.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

enum ViewController: String {
    case countriesViewController = "CountriesViewController"
    case bordersViewController = "BordersViewController"
}

enum Storyboard: String {
    case countries = "Countries"
    case borders = "Borders"
}

extension UIStoryboard {
    static func instantiate(viewController identifier: ViewController, withStoryboard name: Storyboard) -> UIViewController {
        let board = UIStoryboard(name: name.rawValue, bundle: nil)
        return board.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}

