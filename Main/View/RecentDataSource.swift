//
//  RecentDataSource.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class RecentDataSource: NSObject, Presentable {
    
    var viewModel: SearchViewModel
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
}

//MARK:- UITableViewDataSource
extension RecentDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(SearchLinkCell.self, for: indexPath)
        cell.configure(viewModel.recents[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate
extension RecentDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(TitleHeaderView.self)
        view.configure("recent".localized())
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRecent(viewModel.recents[indexPath.row])
    }
 
}
