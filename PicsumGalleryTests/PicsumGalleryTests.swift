//
//  PicsumGalleryTests.swift
//  PicsumGalleryTests
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import XCTest
@testable import Picsum

class PicsumGalleryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPicsumModel() throws {
        let testBundle = Bundle(for: type(of: self))
        guard let filePath = testBundle.path(forResource: "PicsumGallary", ofType: "json")
            else {fatalError("Unable to find Picsum gallary json file")}
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        let authorModel = try JSONDecoder().decode([Author].self, from: data)
        
        XCTAssertEqual(authorModel[0].id, 100, "id should be 100")
        XCTAssertEqual(authorModel[0].author, "Alejandro Escamilla", "author name should be Alejandro Escamilla")
    }
}
