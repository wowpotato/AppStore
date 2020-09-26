//
//  UIViewExtension.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

/// Screen Size
let UISCREEN_WIDTH = UIScreen.main.bounds.width
let UISCREEN_HEIGHT = UIScreen.main.bounds.height

/// nibCache
var cacheViewNibs = NSCache<NSString, UIView>()

extension UIView {

    @IBInspectable public var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue;
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue;
            self.layer.masksToBounds = true
        }
    }
    
    public func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first { return $0.firstAttribute == .height && $0.relation == .equal }
        }
        set { setNeedsLayout() }
    }
    
    var widthConstraint: NSLayoutConstraint? {
        get {
            return constraints.first { return $0.firstAttribute == .width && $0.relation == .equal }
        }
        set { setNeedsLayout() }
    }
    
    var topConstraint: NSLayoutConstraint? {
        get {
            return constraints.first { return $0.firstAttribute == .top && $0.relation == .equal }
        }
        set { setNeedsLayout() }
    }
    
    var leadingConstraint: NSLayoutConstraint? {
        get {
            return constraints.first { return $0.firstAttribute == .leading && $0.relation == .equal }
        }
        set { setNeedsLayout() }
    }
    
    var bottomConstraint: NSLayoutConstraint? {
        get {
            return constraints.first { return $0.firstAttribute == .bottom && $0.relation == .equal }
        }
        set { setNeedsLayout() }
    }
    
    var trailingConstraint: NSLayoutConstraint? {
        get {
            return constraints.first { return $0.firstAttribute == .trailing && $0.relation == .equal }
        }
        set { setNeedsLayout() }
    }
    
    func setConstraint(_ attribute: NSLayoutConstraint?, _ value: CGFloat) {
        attribute?.constant = value
        setNeedsLayout()
    }
}

extension UIView {

    public class func fromNib(cache: Bool = false) -> Self {
            let name = "\(Self.self)"
            guard
                let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
                else { fatalError("missing expected nib named: \(name)") }
            guard
                /// we're using `first` here because compact map chokes compiler on
                /// optimized release, so you can't use two views in one nib if you wanted to
                /// and are now looking at this
                let view = nib.first as? Self
                else { fatalError("view of type \(Self.self) not found in \(nib)") }
            return view
        }
    
    public class func fromNibSize() -> CGSize {
        return fromNib(cache: true).frame.size
    }
    
}
