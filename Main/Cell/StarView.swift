//
//  ResultCell.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class StarView: UIView {
    weak var view: UIView!
    
    @IBOutlet var offImageViews: [UIImageView]!
    @IBOutlet var onImageViews: [UIImageView]!
    
    @IBOutlet weak var offView: UIView!
    @IBOutlet weak var onView: UIView!
    
    @IBOutlet weak var onViewWidthConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        load()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        load()
    }
    
    private func load() {
        let bundle: Bundle = Bundle(for: type(of: self))
        let nib: UINib = UINib(nibName: "StarView", bundle: bundle)
        guard let v: UIView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        self.view = v
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = self.view.backgroundColor
        self.insertSubview(self.view, at: 0)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": self.view as Any]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": self.view as Any]))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ data: Double?) {
        guard var value = data else { return }
        if value < 0 {
            value = 0
        }
        var rate = value / 5.0
        if rate > 1 {
            rate = 1
        }
        self.onViewWidthConstraint.constant = self.frame.size.width * CGFloat(rate)
    }
    
    func setTintColorImage(_ color : UIColor) {
        for item in onImageViews {
            item.setTintColorImage(color)
        }
    }
}
