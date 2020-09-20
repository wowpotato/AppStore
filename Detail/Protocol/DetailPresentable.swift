//
//  DetailPresentable.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

protocol DetailPresentable: UITableViewCell {
    func configure(_ software: Software?)
    static func getHeight() -> CGFloat
}

protocol DetailHeaderPrsentable: UITableViewHeaderFooterView {
    static func getHeight() -> CGFloat
}
