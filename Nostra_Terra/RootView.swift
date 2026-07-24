//
//  ContentView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 17/07/2026.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Carte", systemImage: "map") {
              MapView()
            }
            
            Tab("Recherche", systemImage: "magnifyingglass", role: .search) {
                SearchView()
            }
        }
        .tabBarMinimizeBehavior(.automatic)
    }
}

#Preview {
    RootView()
}
