//
//  GithubUsersUITests.swift
//  GithubUsersUITests
//
//  Created by Alvaro Rojas  on 12/24/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import XCTest

class GithubUsersUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        //Testing Main Flow of the app
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"mojombo")/*[[".cells.containing(.link, identifier:\"https:\/\/github.com\/mojombo\")",".cells.containing(.staticText, identifier:\"mojombo\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Repositories"].tap()
        
        let button = app.otherElements.containing(.navigationBar, identifier:"MOJOMBO").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1)
        button.tap()
        button.tap()
        button.tap()
        app.navigationBars["MOJOMBO"].buttons["Back"].tap()
        
    }

}
