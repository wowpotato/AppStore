//
//  Presentable.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

protocol Presentable: AnyObject , UITableViewDelegate, UITableViewDataSource {
    var viewModel: SearchViewModel { get set }
    
    init(_ viewModel: SearchViewModel)
}

protocol FinalizeDecodable: Decodable {
    static func createFromJSON(_ data: Data) throws -> Self?
}
