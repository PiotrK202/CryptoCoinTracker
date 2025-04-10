
//  CryptoCoinTrackerUITestsCoinList.swift
//  CryptoCoinTrackerUITest
//
//  Created by piotr koscielny on 10/4/25.
//
//
//import XCTest
//@testable import CryptoCoinTracker
//
//final class CryptoCoinTrackerUITestsCoinList: XCTestCase {
//    override func setUpWithError() throws {
//        continueAfterFailure = false
//        
//    }
//    override func tearDownWithError() throws {
//    }
//    
//    func launchApp() -> XCUIApplication {
//        let app = XCUIApplication()
//        app.launchArguments += ["UI Testing","-resetKeychain"]
//        app.launch()
//        return app
//    }
//    
//    func testCoinListView() {
//        let app = launchApp()
//        app.buttons["SignUp"].tap()
//        
//        let username = app.textFields["SignUpUserName"]
//        username.tap()
//        username.typeText("testUser")
//        
//        let email = app.textFields["SignUpEmail"]
//        email.tap()
//        email.typeText("test@test.com")
//        
//        let password = app.secureTextFields["SignUpPassword"]
//        password.tap()
//        password.typeText("1234567890")
//        
//        let birthYear = app.textFields["SignUpBirthYear"]
//        birthYear.tap()
//        birthYear.tap()
//        birthYear.typeText("2000")
//        
//        app.buttons["SignUpButton"].tap()
//        
//        XCTAssertTrue(app.navigationBars["Coins"].waitForExistence(timeout: 2))
//    }
//}
