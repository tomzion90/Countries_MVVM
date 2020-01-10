//
//  UIVIewController.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func reload(_ tableView: UITableView) {
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
}

