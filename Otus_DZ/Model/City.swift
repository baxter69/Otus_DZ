//
//  City.swift
//  Otus_DZ
//
//  Created by Воротников Владимир on 06.01.2026.
//

import Foundation

struct City: Identifiable {
    var id: String {
        "\(name)_\(latitude)_\(longitude)".hashValue.description
    }
    let name: String
    let latitude: Double
    let longitude: Double
}
