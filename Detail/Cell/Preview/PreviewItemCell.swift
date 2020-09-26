//
//  PreviewItemCell.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class PreviewItemCell: UICollectionViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ url: String) {
        self.previewImageView.loadImage(url)
    }
}

