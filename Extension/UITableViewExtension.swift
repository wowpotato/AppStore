//
//  UITableViewExtension.swift
//  appStore
//
//  Created by myslab on 2020/09/18.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    public func registerDefaultCell() {
        register(UITableViewCell.self)
        registerHeaderFooter(UITableViewHeaderFooterView.self)
    }
    
    public func register(_ Class: UITableViewCell.Type) {
        register(Class, forCellReuseIdentifier: String(describing:Class))
    }
    
    public func register(_ Classs: [UITableViewCell.Type]) {
        Classs.forEach { (Class) in
            register(Class, forCellReuseIdentifier: String(describing:Class))
        }
    }
    
    public func registerNibCell(_ Class: UITableViewCell.Type) {
        register(UINib(nibName: String(describing:Class), bundle: nil), forCellReuseIdentifier: String(describing:Class))
    }
    
    public func registerNibCell(_ Classs: [UITableViewCell.Type]) {
        Classs.forEach { (Class) in
            register(UINib(nibName: String(describing:Class), bundle: nil), forCellReuseIdentifier: String(describing:Class))
        }
    }
    
    public func registerHeaderFooter(_ Class: UITableViewHeaderFooterView.Type) {
        register(Class, forHeaderFooterViewReuseIdentifier: String(describing:Class))
    }
    
    public func registerHeaderFooter(_ Classs: [UITableViewHeaderFooterView.Type]) {
        Classs.forEach { (Class) in
            register(Class, forHeaderFooterViewReuseIdentifier: String(describing:Class))
        }
    }
    
    public func registerNibCellHeaderFooter(_ Class: UITableViewHeaderFooterView.Type) {
        register(UINib(nibName: String(describing:Class), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing:Class))
    }
    
    public func registerNibCellHeaderFooter(_ Classs: [UITableViewHeaderFooterView.Type]) {
        Classs.forEach { (Class) in
            register(UINib(nibName: String(describing:Class), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing:Class))
        }
    }
    
    public func dequeueReusableCell<T:UITableViewCell>(_ Class: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing:Class), for: indexPath) as! T
    }
    
    public func dequeueReusableHeaderFooterView<T:UITableViewHeaderFooterView>(_ Class: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing:Class)) as! T
    }

}

extension UICollectionView {
    public func registerNibCell(_ Class: UICollectionViewCell.Type) {
        register(UINib(nibName: String(describing:Class), bundle: nil), forCellWithReuseIdentifier: String(describing:Class))
    }
    
    public func dequeueReusableCell<T:UICollectionViewCell>(_ Class: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing:Class), for: indexPath) as! T
    }
}
