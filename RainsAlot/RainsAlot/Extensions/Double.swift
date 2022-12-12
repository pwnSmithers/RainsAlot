//
//  Double.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 12/12/2022.
//

import Foundation

extension Double {
    func convertToCelsius() -> Int {
        return Int(5.0 / 9.0 * (Double(self) - 32.0))
    }
}
