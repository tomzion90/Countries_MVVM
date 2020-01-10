//
//  CountriesViewControllerDelegate.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

extension CountriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CountryCell, let country = cell.item else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        self.presentBorders(of: country)
    }
}

