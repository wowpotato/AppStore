//
//  Recent.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

struct Recent: Codable {
    static let KEY = "recents"
    let query: String
    
    static func fetchRecent() -> [Recent] {
        guard let recent = try? UserDefaults.standard.get(objectType: Array<Recent>.self, forKey: Recent.KEY) else { return [] }
        return recent
    }
}

extension Recent: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.query == rhs.query
    }
}
