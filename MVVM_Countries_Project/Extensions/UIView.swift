//
//  UIView.swift
//  MVVM_Countries_Project
//
//  Created by Tom Zion on 01/01/2020.
//  Copyright © 2020 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public static func loadFromNib(withFrame frame: CGRect? = nil, identifier: String? = nil, bundle: Bundle = Bundle.main) -> Self? {
        guard let view = bundle.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as? Self else { return nil }
        view.frame = frame ?? view.frame
        return view
    }
}
