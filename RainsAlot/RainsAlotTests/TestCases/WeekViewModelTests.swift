//
//  WeekViewModelTests.swift
//  RainsAlotTests
//
//  Created by Mugalu Smith Yusuf on 13/12/2022.
//

import XCTest
import UIKit
@testable import RainsAlot

class WeekViewModelTests: XCTestCase {

    var viewModel: WeekViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = loadStub(name: "ForecastWeather", extenson: "json")
        let decoder = JSONDecoder()

        let forecastResponse = try! decoder.decode(ForecastWeather.self, from: data)
        viewModel = WeekViewModel(weatherData: forecastResponse.forecast)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testNumberOfDays() {
        XCTAssertEqual(viewModel.numberOfDays, 40)
    }


}

