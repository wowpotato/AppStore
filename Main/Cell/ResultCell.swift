//
//  ResultCell.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var starView: StarView!
    @IBOutlet weak var userRatingLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
    
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var horizontalView: UIView!
    @IBOutlet weak var horizontalImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ software: Software) {
        artworkImageView.loadImage(software.artworkUrl100)
        trackLabel.text = software.trackName
        artistLabel.text = software.artistName
        userRatingLabel.text = String(format: "%d", software.userRatingCount ?? "")
        starView.configure(software.averageUserRating)
        
        configureScreenshot(software)
    }
    
    private func configureScreenshot(_ software: Software) {
        guard let screenshotUrls = software.screenshotUrls else { return }
        if screenshotUrls[safe: 0]?.isPortrait ?? true {
            horizontalView.isHidden = true
            stackView.isHidden = false
            for (index, imageview) in imageViews.enumerated() {
                imageview.loadImage(screenshotUrls[safe: index])
            }
        }
        else {
            horizontalView.isHidden = false
            stackView.isHidden = true
            horizontalImageView.loadImage(screenshotUrls[safe: 0])
        }
    }
}
