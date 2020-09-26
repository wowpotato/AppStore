//
//  FindCell.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class FindCell: UITableViewCell {

    @IBOutlet weak var findLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ recent: Recent, query: String) {
        findLabel.text = recent.query
        findLabel.highlight(searchedText: query)
    }
}
