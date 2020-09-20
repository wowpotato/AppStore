//
//  Find.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

struct Find: Codable {
    let query: String
    
    static func fetchRecent() -> [Recent] {
        let recents = [Recent(query:"London"), Recent(query:"Vienna"), Recent(query:"Lisbon"), Recent(query:"London"),
        Recent(query:"London"), Recent(query:"Vienna"), Recent(query:"Lisbon"), Recent(query:"London"),
        Recent(query:"London"), Recent(query:"Vienna"), Recent(query:"Lisbon"), Recent(query:"London"),
        Recent(query:"London"), Recent(query:"Vienna"), Recent(query:"Lisbon"), Recent(query:"London")]
        return recents
    }
}
