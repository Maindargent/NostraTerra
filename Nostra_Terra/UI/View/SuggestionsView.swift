//
//  SuggestionsView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SuggestionsView: View {
    
    @State var x: [CGFloat] = [0,0,0,0,0]
    @State var degree: [Double] = [0,0,0,0,0]
    @State private var showDetail = false
    @State private var showListSuggestion = false
    let user: User
    let publication: [Publication]
    var shufflePublications = publications.shuffled()
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Image("backgroundPicture")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                
                VStack(alignment: .leading){
                    HStack{
                        AsyncImage(url: user.profilPicture) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "person.slash.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.blueDeepSpace)
                        }
                        .frame(width: 51, height: 51)
                        .clipShape(Circle())
                        .shadow(color: .whiteIvoryMist, radius: 3)
                        .padding(.trailing)
                        .padding(.bottom, 20)
                        
                        Text("Bonjour \(user.firstName) !")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    
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
                        
                        ZStack{
                            ForEach(0..<5, id: \.self){i in
                                
                                SuggestionItem(publication: shufflePublications[i], showDetail: $showDetail)
                                    .offset(x: self.x[i])
                                    .rotationEffect(.init(degrees: self.degree[i]))
                                    .gesture(DragGesture()
                                        .onChanged({ (value) in
                                            
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
                                                
                                            }))
                            }
                            .navigationDestination(isPresented: $showDetail) {
                                PublicationDetailView()
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
                            ForEach(publication) { publication in
                                PublicationItem(publication: publication, showListSuggestion: $showListSuggestion)
                            }
                            .navigationDestination(isPresented: $showListSuggestion) {
                                ListSuggestionView()
                            }
                            
                        }
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    SuggestionsView(user: users[0], publication: publications)
}
