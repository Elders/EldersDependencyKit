//
//  EldersDependencyKitTests.swift
//  EldersDependencyKitTests
//
//  Created by Svetlomir Zhelev on 8/9/23.
//

import XCTest
import EldersDependencyKit

protocol INetworkClient {
    
    func postData()
}

struct MockNetworkClient: INetworkClient {
    
    func postData() {
        print("MockNetworkClient postData() called.")
    }
}

final class EldersDependencyKitTests: XCTestCase {

    override func setUp() {
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDependencyContainerRegister() throws {
        
        let mockedNetworkClient: INetworkClient = MockNetworkClient()
        DependencyContainer.register(mockedNetworkClient)
        
        @Inject var networkClient: INetworkClient
    }
    
    func testWeakResolve() {
        
        let key = "key"
        
        @WeakInjectByKey(key: key) var array: [Int]?
        @WeakInject var array2: [Int]?
        
        XCTAssertNil(array)
        XCTAssertNil(array2)
    }
    
    func testDefaultValue() {
        
        let user1 = "Pesho"
        let user2 = "Gosho"
        
        @Inject(defaultValue: user2) var dependency: String
        
        XCTAssertEqual(dependency, user2)
    }
}
