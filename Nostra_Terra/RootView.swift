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
    @State var selectedTab: AppTab = .landing
    
    @State var publicationManager = PublicationViewModel()
    
    @State var userViewModel = UserViewModel(currentUser: users[0])
    
    @State var notificationViewModel = NotificationViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Accueil", systemImage: "house", value: .landing) {
                SuggestionsView()
            }
            
            Tab("Carte", systemImage: "map", value: .map) {
                MapView()
            }
            
            Tab("Ajouter", systemImage: "plus", value: .addForm) {
                NavigationStack {
                    PublicationAddFormView()
                }
            }
            
            Tab("Recherche", systemImage: "magnifyingglass", value: .search ,role: .search) {
                SearchView()
            }
        }
        .tabBarMinimizeBehavior(.automatic)
        .environment(publicationManager)
        .environment(userViewModel)
        .environment(notificationViewModel)
        
        .overlay(alignment: .bottom) {
            if let notif = notificationViewModel.getNotification() {
                VStack {
                    Spacer()
                    
                    NotificationBanner(notif: notif)
                        .padding()
                        .transition(.move(edge: .leading))
                        .environment(notificationViewModel)
                }
            }
        }
    }
}

#Preview {
    RootView()
}
