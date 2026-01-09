//
//  Weather.swift
//  Otus_DZ
//
//  Created by Воротников Владимир on 06.01.2026.
//

import Foundation

struct WeatherResponse: Decodable {
    let hourly: Hourly
    
    struct Hourly: Decodable {
        let temperature_2m: [Double]
        let time: [String]
    }
}
