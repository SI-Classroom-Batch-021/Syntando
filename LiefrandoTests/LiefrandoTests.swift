//
//  LiefrandoTests.swift
//  LiefrandoTests
//
//  Created by Till Hemmerich on 16.12.24.
//

import XCTest
@testable import Batch21LiefrandoLogin

final class LiefrandoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testEmail_Compliant(){
        
        let viewModel = AuthViewModel()
        viewModel.email = "till@test.com"
        viewModel.checkEmailForCompliance()
        XCTAssertTrue(viewModel.emailCompliant,"Email not compliant but should be!")
        
    }
    
    @MainActor
    func testEmail_NonCompliant(){
        
        let viewModel = AuthViewModel()
        
        viewModel.email = "till@test"
        viewModel.checkEmailForCompliance()
        XCTAssertFalse(viewModel.emailCompliant,"Email is compliant but has no Domain")
        
        
        viewModel.email = "tilltest.com"
        viewModel.checkEmailForCompliance()
        XCTAssertFalse(viewModel.emailCompliant,"Email is compliant but has no @")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
