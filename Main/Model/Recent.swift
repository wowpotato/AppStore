//
//  Recent.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

struct Recent: Codable {
    let query: String
    
    static func fetchRecent() -> [Recent] {
        guard let data = UserDefaults.standard.value(forKey:"recents") as? Data else { return [] }
        guard let recent = try? PropertyListDecoder().decode(Array<Recent>.self, from: data) else { return [] }
        return recent
    }
}

extension Recent: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.query == rhs.query
    }
}
