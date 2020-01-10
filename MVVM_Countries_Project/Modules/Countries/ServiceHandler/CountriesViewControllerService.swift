//
//  CountriesViewControllerService.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

extension CountriesViewController: StateViewTapActionDelegate {
    func fetchData() {
        
        let stateView = StateView.loadFromNib()
        stateView?.delegate = self
        tableView.separatorStyle = .none
        stateView?.set(.loading)
        tableView.backgroundView = stateView
        
        viewModel.fetchCountries {
            [weak self] countries, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if error != nil {
                    stateView?.set(.networkError)
                    return
                }
                
                guard let countries = countries else { return }
                
                if countries.count == 0 {
                    stateView?.set(.empty)
                    return
                }
                
                self.tableView.reloadData()
                self.tableView.backgroundView = nil
                self.tableView.separatorStyle = .singleLine
            }
        }
    }
    
    func stateViewDidTapActionButton() {
        self.fetchData()
    }
}
