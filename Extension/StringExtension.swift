//
//  StringExtension.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

extension String {
    
    var isPortrait: Bool {
        guard let url = URL(string: self) else { return true }
        let sizes = url.lastPathComponent.split(separator: "x")
        guard !sizes.isEmpty else { return true }
        guard let widthS = sizes[safe: 0] else { return true }
        guard let heightS = sizes[safe: 1] else { return true }
        guard let width = Int(String(widthS).digits) else { return true }
        guard let height = Int(String(heightS).digits) else { return true }
        return width < height
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
