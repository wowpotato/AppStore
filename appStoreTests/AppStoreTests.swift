//
//  AppStoreTests.swift
//  AppStoreTests
//
//  Created by myslab on 2020/09/21.
//  Copyright © 2020 mys. All rights reserved.
//

import XCTest
@testable import AppStore

class AppStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        testSaveKeyword()
        testFindKeyword()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testSearch() {
        let viewModel = SearchViewModel()
        viewModel.searchKeyword("카카오뱅크")
    }
    
    func testSaveKeyword() {
        let viewModel = SearchViewModel()
        
        viewModel.saveKeyword("카")
        viewModel.saveKeyword("카카")
        viewModel.saveKeyword("카카오")
        viewModel.saveKeyword("카카오뱅")
        viewModel.saveKeyword("카카오페이지")
        viewModel.saveKeyword("카카오맵")
        viewModel.saveKeyword("카카오네비")
        viewModel.saveKeyword("카카오스토리")
        viewModel.saveKeyword("카카오워크")
        viewModel.saveKeyword("카카오페이")
        viewModel.saveKeyword("카카오택시")
        viewModel.saveKeyword("카카오톡")
        viewModel.saveKeyword("카카오뱅크")
    }
    
    func testFindKeyword() {
        let viewModel = SearchViewModel()
        let recents = viewModel.exposeFindkeyword("카카오뱅크")
        XCTAssertTrue(!recents.isEmpty)
    }
}
