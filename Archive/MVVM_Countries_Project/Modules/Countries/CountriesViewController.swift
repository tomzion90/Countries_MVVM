//
//  CountriesViewController.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CountriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
        fetchData()
    }
    
    func configure() {
        title = "Countries"
        let navigationSortButton = UIBarButtonItem(image: UIImage(named: "sorting_icon"), style: .plain, target: self, action: #selector(sortingWithOptions))
        navigationItem.rightBarButtonItem = navigationSortButton
    }

    func configureTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(cellType: CountryCell.self)
    }
    
    @objc func sortingWithOptions() {
        let alertController = UIAlertController(title: "Sort by:", message: nil, preferredStyle: .actionSheet)
        let sortAlphabetically = UIAlertAction(title: "Alphabets", style: .default) { _ in
            self.sortAlphabetically()
        }
        let sortByAreaSize = UIAlertAction(title: "Area size", style: .default) { _ in
            self.sortByAreaSize()
        }
        
        alertController.addAction(sortAlphabetically)
        alertController.addAction(sortByAreaSize)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func sortAlphabetically() {
        viewModel.countries.sort(by: {$0.name < $1.name})
        self.reload(tableView)
    }
    
    func sortByAreaSize() {
        viewModel.countries.sort(by: {$0 < $1})
        self.reload(tableView)
    }
    
    func presentBorders(of country: Country) {
        let viewController = UIStoryboard.instantiate(viewController: ViewController.bordersViewController, withStoryboard: Storyboard.borders) as! BordersViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.viewModel = BordersViewModel(country: country)
        navigationController?.pushViewController(viewController, animated: true)
    }
}


