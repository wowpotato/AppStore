//
//  ModelWrapper.swift
//  appStore
//
//  Created by myslab on 2020/10/10.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

struct ModelWrapper<T: Decodable>: Decodable {
    let resultCount: Int?
    let results: [T]?
}
