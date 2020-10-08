//
//  SearchViewModel.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

typealias VoidClosure = (() -> Void)
typealias DataSourceClosure = ((SearchType, String) -> Void)
typealias AlertClosure = ((String) -> Void)

enum SearchType {
    case recent, find, result
}

final class SearchViewModel {
     
    var updateClosure: VoidClosure?
    var dataSoureClosure: DataSourceClosure?
    var alertClosure: AlertClosure?
    
    lazy var recentDataSource = {
        return RecentDataSource(self)
    }()
    
    lazy var findDataSource = {
        return FindDataSource(self)
    }()
    
    lazy var resultDataSource = {
        return ResultDataSource(self)
    }()
    
    lazy var network: Network = {
        return Network()
    }()
    
    var query: String = "" {
        didSet {
            if query.isEmpty {
                self.findRecents.removeAll()
                return
            }
            self.findRecents = self.findKeyword(query)
        }
    }
    
    /// 최근검색어
    private(set) var recents: [Recent] = Recent.fetchRecent()
    
    /// 로컬 히스토리 최근 검색어 (query)
    private(set) var findRecents: [Recent] = []
    
    /// 소프트웨어 검색
    private(set) var softwares: [Software] = []
    
    func getDataSource(_ type: SearchType) -> Presentable {
        switch type {
        case .recent:
            return recentDataSource
        case .find:
            return findDataSource
        case .result:
            return resultDataSource
        }
    }
    
    //MARK:- 검색
    func didSelectRecent(_ recent: Recent) {
        self.softwares.removeAll()
        self.dataSoureClosure?(.result, recent.query)
        self.searchKeyword(recent.query)
    }
    
    //MARK:- 상세
    func didSelectSoftware(_ software: Software) {
        let vc = DetailViewController.pushViewController()
        vc.software = software
    }
    
    //MARK:- 검색시도
    func searchKeyword(_ text: String) {
        self.softwares.removeAll()
        self.updateClosure?()
        self.saveKeyword(text)
        
        network.fetchList(text) { [weak self] (result: Result<SoftwareWrapper,APIError>) in
            guard let `self` = self else { return }
            switch result {
            case .success(let model):
                guard let results = model.results else { return }
                self.softwares.append(contentsOf: results)
                self.updateClosure?()
            case .failure(let error):
                switch error {
                case .data:
                    self.alertClosure?("network_error".localized())
                case .decodingJSON:
                    self.alertClosure?("encoding_error".localized())
                }
            }
        }
    }
    
    //MARK:- 검색어 저장
    func saveKeyword(_ text: String) {
        let recent = Recent(query: text)
        if let index = self.recents.firstIndex(of: recent) {
            self.recents.remove(at: index)
        }
        recents.insert(recent, at: 0)
        guard let encode = try? PropertyListEncoder().encode(self.recents) else { return }
        UserDefaults.standard.set(encode, forKey:"recents")
    }
    
    //MARK:- 로컬 검색어 찾기
    private func findKeyword(_ text: String) -> [Recent] {
        return recents.filter{ $0.query.contains(text) }
    }
    
}

#if DEBUG
extension SearchViewModel {
    public func exposeFindkeyword(_ text: String) -> [Recent] {
        return self.findKeyword(text)
    }
}
#endif
