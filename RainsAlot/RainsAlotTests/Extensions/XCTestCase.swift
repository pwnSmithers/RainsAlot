//
//  XCTestCase.swift
//  RainsAlotTests
//
//  Created by Mugalu Smith Yusuf on 11/12/2022.
//

import XCTest

extension XCTestCase {

    func loadStub(name: String, extenson: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: extenson)
        return try! Data(contentsOf: url!)
    }

}

