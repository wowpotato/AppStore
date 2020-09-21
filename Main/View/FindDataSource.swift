//
//  FindDataSource.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class FindDataSource: NSObject, Presentable {
    
    var viewModel: SearchViewModel
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
}

//MARK:- UITableViewDataSource
extension FindDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.findRecents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(FindCell.self, for: indexPath)
        cell.configure(viewModel.findRecents[indexPath.row], query: viewModel.query)
        return cell
    }
}

//MARK:- UITableViewDelegate
extension FindDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(UITableViewHeaderFooterView.self)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FindCell.fromNibSize().height    // 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRecent(viewModel.findRecents[indexPath.row])
    }
}
