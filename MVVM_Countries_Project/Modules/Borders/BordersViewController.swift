//
//  BordersViewController.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import UIKit

class BordersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: BordersViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
        fetchBorders()
    }
    
    func configure() {
        title = "\(viewModel.country.name) Borders"
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
        
        tableView.register(cellType: BorderCell.self)
    }
}
