//
//  SearchTitleCell.swift
//  appStore
//
//  Created by myslab on 2020/09/17.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class SearchLinkCell: UITableViewCell {

    @IBOutlet weak var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .default
    }

    func configure(_ recent: Recent) {
        linkLabel.text = recent.query
    }
}
