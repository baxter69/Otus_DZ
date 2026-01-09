//
//  DeepDetailsView.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine
import SwiftUI

struct DeepDetailsView: View {
    let title: String
    @EnvironmentObject private var nav: NavigationViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Третий экран")
            Text(title)
            
            Button("Назад") {
                nav.pop()
            }
        }
    }
}
