//
//  ResultDataSource.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class ResultDataSource: NSObject, Presentable {
    
    var viewModel: SearchViewModel
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
}

//MARK:- UITableViewDataSource
extension ResultDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.softwares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ResultCell.self, for: indexPath)
        cell.configure(viewModel.softwares[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate
extension ResultDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(UITableViewHeaderFooterView.self)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cell = ResultCell.fromNib(cache: true)
        return cell.stackView.bottomConstraint?.constant ?? 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ResultCell.fromNibSize().height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectSoftware(viewModel.softwares[indexPath.row])
    }
}
