//
//  BorderCell.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import UIKit

class BorderCell: UITableViewCell {

    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with border: Border) {
        englishNameLabel.text = border.name
        nativeNameLabel.text = border.nativeName
    }
}
