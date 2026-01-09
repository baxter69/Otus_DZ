//
//  WeatherDetailsView.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine
import SwiftUI

struct WeatherDetailsView: View {
    let title: String
    @EnvironmentObject private var nav: NavigationViewModel
    @State private var offset: CGSize = .zero
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .underline()
                .offset(offset)
                .onTapGesture {
                    withAnimation(.timingCurve(0.2, 0.8, 0.3, 1)) {
                        offset = CGSize(width: 0, height: 600)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        nav.push(.deep(title))
                    }
                }
            
            Button("Назад") {
                nav.pop()
            }
        }
    }
}
