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
        return fromNib(cache: cache, as: self)
    }
    
    private class func fromNib<T>(cache: Bool = false, as type: T.Type) -> T {
        let className = String(describing:self)
        if cache, let view = cacheViewNibs.object(forKey: className as NSString) {
            return view as! T
        }
        if let path: String = Bundle.main.path(forResource: className, ofType: "nib") {
            if FileManager.default.fileExists(atPath: path) {
                let view: UIView = Bundle.main.loadNibNamed(className, owner: nil, options: nil)!.first as! UIView
                if cache  {
                    cacheViewNibs.countLimit = 50
                    cacheViewNibs.setObject(view, forKey: className as NSString)
                }
                return view as! T
            }
        }
        
        fatalError("\(className) XIB File Not Exist")
    }
    
    public class func fromNibSize() -> CGSize {
        return fromNib(cache: true).frame.size
    }
    
}
