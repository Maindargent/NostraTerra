//
//  SuggestionsView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SuggestionsView: View {
    @Environment(PublicationViewModel.self) var publicationsManager
    @Environment(UserViewModel.self) var userViewModel
    
    @State var x: [CGFloat] = [0,0,0,0,0]
    @State var degree: [Double] = [0,0,0,0,0]
    
    @State private var path: [SuggestionScreen] = []
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                
                Image("backgroundPicture")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack(alignment: .leading){
                        HStack(alignment: .center, spacing: 16){
                            Button{
                                path.append(SuggestionScreen.profile)
                            }label: {
                                AsyncImage(url: userViewModel.currentUser.profilPicture) { image in
                                    image.resizable()
                                } placeholder: {
                                    Image(systemName: "person.slash.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.blueDeepSpace)
                                }
                                .frame(width: 51, height: 51)
                                .clipShape(Circle())
                                .shadow(color: .whiteIvoryMist, radius: 3)
                            }
                            
                            Text("Bonjour \(userViewModel.currentUser.firstName) !")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.whiteIvoryMist)
                        }
                        .padding(.bottom, 20)
                        
                        Text("Suggestions")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.whiteIvoryMist)
                        
                        ZStack{
                            VStack{
                                Text("Vous pouvez revoir vos suggestions.")
                                    .font(.footnote)
                                    .foregroundStyle(.whiteIvoryMist)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                Button(action: {
                                    for i in 0..<self.x.count{
                                        self.x[i] = 0
                                    }
                                    
                                    for i in 0..<self.degree.count{
                                        self.degree[i] = 0
                                    }
                                }) {
                                    
                                    Image(systemName: "repeat.circle.fill")
                                        .font(.title)
                                        .tint(.yellowTuscanSun)
                                    
                                }
                            }
                            
                            
                            
                            ZStack {
                                ForEach(publicationsManager.suggestionPublicationsShuffled, id: \.element.id) {i, publication in
                                    SuggestionItem(publication: publication, path: $path)
                                        .offset(x: self.x[i])
                                        .rotationEffect(.init(degrees: self.degree[i]))
                                        .gesture(
                                            DragGesture()
                                                .onChanged({(value) in
                                                    if value.translation.width > 0 {
                                                        self.x[i] = value.translation.width
                                                        self.degree[i] = 7
                                                    } else {
                                                        self.x[i] = value.translation.width
                                                        self.degree[i] = -7
                                                    }
                                                })
                                                .onEnded({ (value) in
                                                    if value.translation.width > 0 {
                                                        if value.translation.width > 100 {
                                                            self.x[i] = 500
                                                            self.degree[i] = 12
                                                        } else {
                                                            self.x[i] = 0
                                                            self.degree[i] = 0
                                                        }
                                                    } else {
                                                        if value.translation.width < -100 {
                                                            self.x[i] = -500
                                                            self.degree[i] = -15
                                                        } else {
                                                            self.x[i] = 0
                                                            self.degree[i] = 0
                                                        }
                                                    }
                                                })
                                        )
                                }
                            }
                        }
                        .padding()
                        .animation(.default)
                        
                        Text("Découverte de nos régions")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.whiteIvoryMist)
                        
                        
                        ScrollView(.horizontal){
                            HStack(alignment: .bottom){
                                ForEach(FrenchRegion.allCases) { region in
                                    PublicationRegionItem(regions: region, path: $path)
                                }
                                
                            }
                        }
                        
                    }
                    .padding()
                }
                .navigationDestination(for: SuggestionScreen.self) { screen in
                    switch screen {
                        case .profile:
                            ProfileView()
                            
                        case .discoverRegion(let region):
                        DiscoverRegionView(selectedRegion: region)
                            
                    case .publicationDetail(let publicationID):
                        PublicationDetailView(publicationID: publicationID)
                    }
                }
            }
            
        }
    }
}


#Preview { 
    @Previewable @State var publicationManager = PublicationViewModel()
    @Previewable @State var userViewModel = UserViewModel(currentUser: users[0])
    
    SuggestionsView()
        .environment(publicationManager)
        .environment(userViewModel)
}

