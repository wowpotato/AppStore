//
//  SearchViewController.swift
//  appStore
//
//  Created by myslab on 2020/09/16.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateNavigationController()
        bindModelClosure()
        updateSearchController()
        updateTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateNavigationController()
    }
    
    //MARK:- 네비게이션 설정
    private func updateNavigationController() {
        self.navigationController?.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        self.navigationController?.navigationBar.standardAppearance = appearance
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesSearchBarWhenScrolling = false
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "cancel".localized()
    }
    
    //MARK:- 검색 컨트롤러 설정
    private func updateSearchController() {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "place_holder".localized()
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = true
        self.navigationItem.searchController = searchController
    }
    
    //MARK:- 테이블뷰 설정
    private func updateTableView() {
        tableView.registerHeaderFooter(UITableViewHeaderFooterView.self)
        tableView.registerNibCellHeaderFooter(TitleHeaderView.self)
        tableView.registerNibCell(SearchLinkCell.self)
        tableView.registerNibCell(FindCell.self)
        tableView.registerNibCell(ResultCell.self)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 60
        
        setDataSource(.recent)
    }
    
    //MARK:- 클로저 연결
    private func bindModelClosure() {
        /// reload tableview
        viewModel.updateClosure = { [unowned self] () in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        /// reload tableview datasourece
        viewModel.dataSoureClosure = { [unowned self] (type, query) in
            self.navigationItem.searchController?.searchBar.text = query
            self.navigationItem.searchController?.isActive = true
            self.setDataSource(type)
        }
        
        /// Show alert
        viewModel.alertClosure = { [unowned self] (message) in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok".localized(), style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK:- 데이터소스 변경
    private func setDataSource(_ type: SearchType) {
        setTableViewSeparatorStyle(type)
        tableView.dataSource = viewModel.getDataSource(type)
        tableView.delegate = viewModel.getDataSource(type)
        tableView.reloadData()
    }
    
    //MARK:- 테이블뷰 라인 스타일 변경
    private func setTableViewSeparatorStyle(_ type: SearchType) {
        switch type {
        case .recent, .find:
            tableView.separatorStyle = .singleLine
        case .result:
            tableView.separatorStyle = .none
        }
    }
    
}

//MARK:- UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        viewModel.searchKeyword(text)
        setDataSource(.result)
    }
    
    /// Set default tableView
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        setDataSource(.recent)
    }
    
    ///
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.query = searchText
        if searchText.isEmpty {
            setDataSource(.recent)
        }
        else {
            setDataSource(.find)
        }
    }
}
