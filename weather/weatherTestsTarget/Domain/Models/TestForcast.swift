//
//  ModelsTest.swift
//  weather
//
//  Created by Muhammad Faheem Khan on 08/08/2022.
//

import XCTest
@testable import weather

class TestForcast: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsingJson() throws {
        
        let json = """
                   {
                     "cod": "200",
                     "message": 0,
                     "cnt": 40,
                     "list": [
                       {
                         "dt": 1659312000,
                         "main": {
                           "temp": 302.21,
                           "feels_like": 308.06,
                           "temp_min": 302.21,
                           "temp_max": 302.87,
                           "pressure": 1012,
                           "sea_level": 1012,
                           "grnd_level": 988,
                           "humidity": 80,
                           "temp_kf": -0.66
                         },
                         "weather": [
                           {
                             "id": 803,
                             "main": "Clouds",
                             "description": "broken clouds",
                             "icon": "04d"
                           }
                         ],
                         "clouds": {
                           "all": 78
                         },
                         "wind": {
                           "speed": 2.93,
                           "deg": 275,
                           "gust": 3.91
                         },
                         "visibility": 10000,
                         "pop": 0,
                         "sys": {
                           "pod": "d"
                         },
                         "dt_txt": "2022-08-01 00:00:00"
                       }
                     ]
                   }
                   """
        
        let jsonData = json.data(using: .utf8)!
        let forcasts = try! JSONDecoder().decode(Forcast.self, from: jsonData)
        
        
        

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
