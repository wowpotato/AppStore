//
//  RouterProtocol.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    static var storyboardName: String { get }
}

extension RouterProtocol where Self: UIViewController {

    //MARK:- assembleModule
    static private func assembleModule() -> Self {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: String(describing:self)) as? Self {
            return vc
        }
        fatalError("======= \(String(describing:self)) is not RouterProtocol ")
    }
    
    //MARK:- getViewController
    static func getViewController() -> Self {
        let vc = assembleModule()
        return vc
    }
    
    //MARK:- pushViewController
    @discardableResult
    static func pushViewController() -> Self {
        print(" ✈️ pushViewController : \(String(describing:self))")
        let vc = getViewController()
        
        let keyWindow = UIApplication.shared.connectedScenes
        .lazy
        .filter { $0.activationState == .foregroundActive }
        .compactMap { $0 as? UIWindowScene }
        .first?
        .windows
        .first { $0.isKeyWindow }
        
        guard let nvc = keyWindow?.rootViewController as? UINavigationController else { return vc }
        nvc.pushViewController(vc, animated: true)
        return vc
    }
    
}
