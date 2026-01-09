//
//  WetherListView.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine
import SwiftUI

struct WeatherListView: View {
    @StateObject private var vm: WeatherListViewModel
    @EnvironmentObject private var nav: NavigationViewModel

    init(city: City) {
        let service = WeatherService()
        _vm = StateObject(
            wrappedValue: WeatherListViewModel(
                city: city,
                service: service
            )
        )
    }

    var body: some View {
        List {
            ForEach(vm.rows.indices, id: \.self) { index in
                Text(vm.rows[index].title)
                    .onAppear {
                        Task {
                            await vm.loadNextPageIfNeeded(index: index)
                        }
                    }
                    .onTapGesture {
                        nav.push(.details(vm.rows[index].title))
                    }
            }

            if vm.isLoading {
                ProgressView()
            }
        }
        .task {
            await vm.onAppear()
        }
    }
}
