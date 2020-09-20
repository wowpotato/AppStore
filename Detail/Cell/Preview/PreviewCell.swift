//
//  PreviewCell.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

class PreviewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var software: Software?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.registerNibCell(PreviewItemCell.self)
        self.collectionView.decelerationRate = .fast
    }
    
    func configure(_ software: Software?) {
        guard let software = software else { return }
        self.software = software
    }
}

extension PreviewCell: DetailPresentable {
    static func getHeight() -> CGFloat {
        return PreviewCell.fromNibSize().height
    }
}

extension PreviewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let software = self.software, let screenshotUrls = software.screenshotUrls else { return 0 }
        return screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(PreviewItemCell.self, for: indexPath)
        guard let software = self.software, let screenshotUrls = software.screenshotUrls else { return cell }
        cell.configure(screenshotUrls[indexPath.row])
        return cell
    }
}

