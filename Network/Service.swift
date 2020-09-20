//
//  Service.swift
//  appStore
//
//  Created by myslab on 2020/09/17.
//  Copyright © 2020 mys. All rights reserved.
//

import Foundation

enum APIError: Error {
    case data
    case decodingJSON
}

struct Service {
    /// Sample - https://itunes.apple.com/search?term=mytoday&country=KR
    /// https://itunes.apple.com/search?term=%EC%B9%B4%EC%B9%B4%EC%98%A4%EB%B1%85%ED%81%AC&country=KR&entity=software
    static let url = "https://itunes.apple.com/search"
    static let term = "term"
    static let country = "country"
    static let entity = "entity"
    static let media = "media"
}

class Network {
    
    var task: URLSessionDataTask?
    
    func fetchList<T: Decodable>(_ keyword: String, completion: @escaping (Result<T, APIError>) -> Void) {
        guard var components = URLComponents(string: Service.url) else { return }
        let term = URLQueryItem(name: Service.term, value: keyword)
        let country = URLQueryItem(name: Service.country, value: Locale.current.regionCode ?? "KR")
        let entity = URLQueryItem(name: Service.entity, value: "software")
        let media = URLQueryItem(name: Service.media, value: "software")
        components.queryItems = [term, country, entity, media]
        guard let url = components.url else { return }
        print("🚀🚀🚀 URL = \(url)")
        
        self.task?.cancel()
        self.task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return completion(.failure(.data)) }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(.decodingJSON))
            }
        }
        self.task?.resume()
    }
}
