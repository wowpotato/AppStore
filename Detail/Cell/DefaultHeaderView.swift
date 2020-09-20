//
//  DefaultHeaderView.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class DefaultHeaderView: UITableViewHeaderFooterView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView(frame: self.bounds)
        backgroundView.backgroundColor = .systemBackground
        self.backgroundView = backgroundView
    }
    
}

extension DefaultHeaderView: DetailHeaderPrsentable {
    static func getHeight() -> CGFloat {
        return 0
    }
}
