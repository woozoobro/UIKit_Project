//
//  UIBarButtonItem+CustomView.swift
//  carrot_market
//
//  Created by 우주형 on 2023/09/11.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
        if let width = width {
            NSLayoutConstraint.activate([customView.widthAnchor.constraint(equalToConstant: width)])
        }
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
    }
}
