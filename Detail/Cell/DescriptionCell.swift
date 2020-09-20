//
//  DescriptionCell.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ software: Software?) {
        guard let software = software else { return }
        descriptionLabel.text = software.description
        sellerNameLabel.text = software.sellerName
    }
}

extension DescriptionCell: DetailPresentable {
    static func getHeight() -> CGFloat {
        return DescriptionCell.fromNibSize().height
    }
}
