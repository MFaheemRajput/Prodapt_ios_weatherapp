//
//  ForcastTest.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 08/08/2022.
//

import XCTest
@testable import weather

class ForcastTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testParsingJson() throws {
        let data = readJSONFromFile(fileName: "CorrectForcasts", type: Forcast.self)
        if let forcasts = data {
            XCTAssertEqual("200", forcasts.cod)
            XCTAssertNotNil(forcasts.list, "list is not empty")
            XCTAssertEqual(302.21, forcasts.list![0].main!.temp)
        }
    }
    
    func testParsingDirtyJson() throws {
        let data = readJSONFromFile(fileName: "CorrentForcasts", type: Forcast.self)
        if let forcasts = data {
            
            XCTAssertEqual("", forcasts.list![0].weather![0].main)
        }
    }
    
    
    func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
