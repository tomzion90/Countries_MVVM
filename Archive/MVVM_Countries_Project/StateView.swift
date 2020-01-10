//
//  StateView.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import UIKit

protocol StateViewTapActionDelegate: class {
    func stateViewDidTapActionButton()
}

class StateView: UIView {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    weak var delegate: StateViewTapActionDelegate?
    
    enum State {
        case loading
        case empty
        case networkError
    }
    
    func set(_ state: State) {
        switch state {
        case .loading:
            stateLabel.text = "Loading"
            stateImage.image = UIImage(named: "loading_state")
            actionButton.isHidden = true
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .empty:
            stateLabel.text = "No boarders found"
            stateImage.image = UIImage(named: "empty_state")
            actionButton.isHidden = true
            activityIndicator.isHidden = true
        case .networkError:
            stateLabel.text = "No signal found"
            stateImage.image = UIImage(named: "network_error_state")
            actionButton.isHidden = false
            activityIndicator.isHidden = true
        }
    }
    
    @IBAction func didTapActionButton(_ sender: Any) {
        delegate?.stateViewDidTapActionButton()
    }
    

}
