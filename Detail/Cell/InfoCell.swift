//
//  InfoCell.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ software: Software?) {
        guard let software = software else { return }
        infoLabel.text = software.sellerName
    }
}

extension InfoCell: DetailPresentable {
    static func getHeight() -> CGFloat {
        return InfoCell.fromNibSize().height
    }
}
