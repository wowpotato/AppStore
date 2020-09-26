//
//  DetailTitleCell.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class DetailTitleCell: UITableViewCell {

    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var starView: StarView!
    @IBOutlet weak var userRatingLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var contentRankingLabel: UILabel!
    
    @IBOutlet weak var starWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ software: Software?) {
        guard let software = software else { return }
        artistImageView.loadImage(software.artworkUrl512)
        trackLabel.text = software.trackName
        artistLabel.text = software.artistName
        contentRankingLabel.text = software.trackContentRating
        userRatingLabel.text = String(format: "%d개의 평가", software.userRatingCount ?? "")
        starView.configure(software.averageUserRating)
        
        configureGenre(software)
    }
    
    private func configureGenre(_ software: Software) {
        guard let genres = software.genres, let genre = genres[safe: 0] else { return }
        genreLabel.text = genre
    }
}

extension DetailTitleCell: DetailPresentable {
    static func getHeight() -> CGFloat {
        return DetailTitleCell.fromNibSize().height
    }
}
