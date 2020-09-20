//
//  TitleHeaderView.swift
//  appStore
//
//  Created by myslab on 2020/09/18.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

class TitleHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView(frame: self.bounds)
        backgroundView.backgroundColor = .systemBackground
        self.backgroundView = backgroundView
    }
    
    func configure(_ text: String) {
        titleLabel.text = text
    }
}
