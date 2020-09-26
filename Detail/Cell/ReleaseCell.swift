//
//  ReleaseCell.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class ReleaseCell: UITableViewCell {

    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ software: Software?) {
        guard let software = software else { return }
        versionLabel.text = "\("version".localized()) \(software.version ?? "")"
        updateLabel.text = software.currentVersionReleaseDate
        releaseLabel.text = software.releaseNotes
    }
}

extension ReleaseCell: DetailPresentable {
    static func getHeight() -> CGFloat {
        return ReleaseCell.fromNibSize().height
    }
}
