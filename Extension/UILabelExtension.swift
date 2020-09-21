//
//  UILabelExtension.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

extension UILabel {

    func highlight(searchedText: String?..., color: UIColor = UIColor(named: "FindFocusColor") ?? .red) {
        guard let txtLabel = self.text else { return }

        let attributeTxt = NSMutableAttributedString(string: txtLabel)
        let range = NSRange(location: 0, length: txtLabel.count)
        attributeTxt.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemGray, range: range)
        self.attributedText = attributeTxt
        
        searchedText.forEach {
            if let searchedText = $0?.lowercased() {
                let range: NSRange = attributeTxt.mutableString.range(of: searchedText, options: .caseInsensitive)

                attributeTxt.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
                attributeTxt.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: self.font.pointSize), range: range)
            }
        }

        self.attributedText = attributeTxt
    }

}
