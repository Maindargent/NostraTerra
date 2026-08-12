//
//  DiscoverRegionView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 01/08/2026.
//

import SwiftUI

struct DiscoverRegionView: View {
    
    @Environment(PublicationViewModel.self) var publicationsManager
    
    let selectedRegion: FrenchRegion
        
    var body: some View {
        ZStack{
            Image("backgroundPicture")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack (alignment: .trailing){
                HStack{
                    Spacer()
                    NavigationLink{
                        RegionView(selectedRegion: selectedRegion)
                            .ignoresSafeArea()
                    }label: {
                        Image(systemName: "book.pages")
                            .foregroundStyle(.whiteIvoryMist)
                            .font(.title)
                            .bold()
                    }
                    .padding(.trailing, 20)
                }
                
                VStack (alignment: .leading, spacing: 0){
                    
                    if !publicationsManager.getRegionPublications(selectedRegion: selectedRegion).isEmpty{
                        Text("Les traditions de votre région :\n")
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    
                    ScrollView{
                        ForEach(publicationsManager.getRegionPublications(selectedRegion: selectedRegion), id: \.id) { publication in
                            NavigationLink{
                                PublicationDetailView(publicationID: publication.id)
                            }label: {
                                SearchItem(publication: publication)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding()
                }
                .padding()
                .frame(maxHeight: .infinity, alignment: .top)
                
            }
        }
        .overlay {
            if publicationsManager.getRegionPublications(selectedRegion: selectedRegion).isEmpty {
                ContentUnavailableView(
                    "Aucun résultat pour \(selectedRegion.titre)",
                    systemImage: "magnifyingglass",
                    description: Text("N'hésitez pas à enrichir cette région.")
                )
                .foregroundStyle(.whiteIvoryMist)
            }
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    
    DiscoverRegionView(selectedRegion: .provenceAlpesCoteDAzur)
        .environment(publicationManager)
}
