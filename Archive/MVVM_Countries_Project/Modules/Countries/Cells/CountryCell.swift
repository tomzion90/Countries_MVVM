//
//  CountryCell.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    var item: Country?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        englishNameLabel.text = nil
        nativeNameLabel.text = nil
        areaLabel.text = nil
    }
    
    func fill(with country: Country) {
        self.item = country
        englishNameLabel.text = country.name
        nativeNameLabel.text = country.nativeName

        guard let area = country.area else {
            areaLabel.text = "0"
            return
        }
        areaLabel.text = "\(area) sq km"
    }
}
