//
//  AppStoreUITests.swift
//  AppStoreUITests
//
//  Created by myslab on 2020/09/21.
//  Copyright © 2020 mys. All rights reserved.
//

import XCTest

class AppStoreUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        try testSearch()
        XCUIApplication().navigationBars["AppStore.DetailView"].buttons["검색"].tap()
        XCUIApplication().navigationBars["검색"].buttons["Cancel"].tap()
        try testSaveText()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testSearch() throws {
        let app = XCUIApplication()
        app.navigationBars["검색"].searchFields["게임, 앱, 스토리 등"].tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["ㅋ"]/*[[".keyboards.keys[\"ㅋ\"]",".keys[\"ㅋ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["ㅏ"]/*[[".keyboards.keys[\"ㅏ\"]",".keys[\"ㅏ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key.tap()
        key2.tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["ㅇ"]/*[[".keyboards.keys[\"ㅇ\"]",".keys[\"ㅇ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["ㅗ"]/*[[".keyboards.keys[\"ㅗ\"]",".keys[\"ㅗ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        
        app/*@START_MENU_TOKEN@*/.keys["ㅂ"]/*[[".keyboards.keys[\"ㅂ\"]",".keys[\"ㅂ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["ㅐ"]/*[[".keyboards.keys[\"ㅐ\"]",".keys[\"ㅐ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key3.tap()
        key.tap()
        
        let key5 = app/*@START_MENU_TOKEN@*/.keys["ㅡ"]/*[[".keyboards.keys[\"ㅡ\"]",".keys[\"ㅡ\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"검색\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"카카오뱅크 - 같지만 다른 은행")/*[[".cells.containing(.staticText, identifier:\"7722\")",".cells.containing(.staticText, identifier:\"KakaoBank Corp.\")",".cells.containing(.staticText, identifier:\"카카오뱅크 - 같지만 다른 은행\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).tap()
    }
    
    func testSaveText() throws {
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["카카오뱅크"]/*[[".cells.staticTexts[\"카카오뱅크\"]",".staticTexts[\"카카오뱅크\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"카카오뱅크 - 같지만 다른 은행")/*[[".cells.containing(.staticText, identifier:\"7717\")",".cells.containing(.staticText, identifier:\"KakaoBank Corp.\")",".cells.containing(.staticText, identifier:\"카카오뱅크 - 같지만 다른 은행\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).tap()
    }
    
}
