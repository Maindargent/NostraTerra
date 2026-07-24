//
//  ContentView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 17/07/2026.
//

import SwiftUI

enum AppTab: String, CaseIterable {
    case landing = "Accueil"
    case map = "Carte"
    case addForm = "Ajouter"
    case search = "Recherche"
}

struct RootView: View {
    @State var selectedTab: AppTab = .map
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Accueil", systemImage: "house", value: .landing) {
                SuggestionsView()
            }
            Tab("Carte", systemImage: "map", value: .map) {
              MapView()
            }
            Tab("Ajouter", systemImage: "plus", value: .addForm) {
              PublicationAddFormView()
            }
            
            Tab("Recherche", systemImage: "magnifyingglass", value: .search ,role: .search) {
                SearchView()
            }
        }
        .tabBarMinimizeBehavior(.automatic)
    }
}

#Preview {
    RootView()
}
