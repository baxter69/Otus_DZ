//
//  RootView.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine
import SwiftUI

struct RootView: View {
    @StateObject private var navigationVM = NavigationViewModel()
    @State private var selectedCity = 0

    private let cities: [City] = [
        City(name: "Москва", latitude: 55.75, longitude: 37.61),
        City(name: "Лондон", latitude: 51.51, longitude: -0.13),
        City(name: "Нью-Йорк", latitude: 40.71, longitude: -74.00)
    ]

    var body: some View {
        VStack {
            if case .list = navigationVM.stack.last {
                Picker("City", selection: $selectedCity) {
                    ForEach(cities.indices, id: \.self) {
                        Text(cities[$0].name)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }

            NavigationContainer(city: cities[selectedCity])
                .id(cities[selectedCity].id)
        }
        .environmentObject(navigationVM)
    }
}
