//
//  DetailViewController.swift
//  appStore
//
//  Created by myslab on 2020/09/20.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, RouterProtocol {
    enum Section: Int, CaseIterable {
        case title, release, screenshot, description, info
        
        var cellType: DetailPresentable.Type {
            switch self {
            case .title:
                return DetailTitleCell.self
            case .release:
                return ReleaseCell.self
            case .screenshot:
                return PreviewCell.self
            case .description:
                return DescriptionCell.self
            default:
                return InfoCell.self
            }
        }
        
        var headerType: DetailHeaderPrsentable.Type {
            switch self {
            case .info:
                return InfoHeaderView.self
            default:
                return DefaultHeaderView.self
            }
        }
    }
    
    static var storyboardName: String = "Main"
    @IBOutlet weak var tableView: UITableView!
    
    var lastContentOffset: CGFloat = 0
    var software: Software?
    
    override func loadView() {
        super.loadView()
        
        self.navigationController?.navigationBar.isTranslucent = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self)
        Section.allCases.forEach{ self.tableView.registerNibCell($0.cellType) }
        Section.allCases.forEach{ self.tableView.registerNibCellHeaderFooter($0.headerType) }
        self.tableView.reloadData()
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard self.software != nil else { return 0 }
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        }
        guard let cell = tableView.dequeueReusableCell(section.cellType, for: indexPath) as? DetailPresentable else {
            return tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        }
        cell.configure(software)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Section(rawValue: section) else { return nil }
        return tableView.dequeueReusableHeaderFooterView(section.headerType)
    }
}

extension DetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.section) else { return 0 }
        return section.cellType.getHeight()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else { return 0 }
        return section.headerType.getHeight()
    }
}
