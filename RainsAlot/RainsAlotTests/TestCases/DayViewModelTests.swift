//
//  DayViewModelTests.swift
//  RainsAlotTests
//
//  Created by Mugalu Smith Yusuf on 11/12/2022.
//

import XCTest
import UIKit
@testable import RainsAlot

final class DayViewModelTests: XCTestCase {

    var viewModel: DayViewModel!

    override func setUpWithError() throws {
        let data = loadStub(name: "CurrentWeather", extenson: "json")

        let decoder = JSONDecoder()
        let currentWeatherResponse = try! decoder.decode(CurrentWeather.self, from: data)

        viewModel = DayViewModel(currentWeatherData: currentWeatherResponse.current, currentWind: currentWeatherResponse.wind, todaysWeather: currentWeatherResponse.weather, currentLoaction: currentWeatherResponse.locationName)
    }

    func testDescription() {
        XCTAssertEqual(viewModel.currentWeatherCondition, "Clouds")
    }

    func testTempreture() {
        XCTAssertEqual(viewModel.currentTemperature, "283.1 °F")
    }

    func testMinTemperature() {
        XCTAssertEqual(viewModel.minTemperature, "283.1 °F")
    }


    func testImage() {
        let viewModelImage = viewModel.backgroundImage
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataReference = UIImage(named: "Cloudy")!.pngData()!

        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 360.0)
        XCTAssertEqual(viewModelImage!.size.height, 320.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }

    override func tearDownWithError() throws {
       viewModel = nil
    }

}
