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
        ZStack {
            Image("backgroundPicture")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment: .trailing) {
                HStack(alignment: .center) {
                    Spacer()
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView {
                        ForEach(publicationsManager.getRegionPublications(selectedRegion: selectedRegion), id: \.id) { publication in
                            NavigationLink{
                                PublicationDetailView(publicationID: publication.id)
                            }label: {
                                SearchItem(publication: publication)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .contentMargins(16, for: .scrollContent)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
            }
            .navigationTitle(selectedRegion.titre)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        RegionView(selectedRegion: selectedRegion)
                            .ignoresSafeArea()
                    }label: {
                        Image(systemName: "book.pages")
                            .foregroundStyle(.whiteIvoryMist)
                            .font(.title3)
                            .bold()
                            .padding()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
//        .overlay {
//            if publicationsManager.getRegionPublications(selectedRegion: selectedRegion).isEmpty {
//                ContentUnavailableView(
//                    "Aucun résultat pour \(selectedRegion.titre)",
//                    systemImage: "magnifyingglass",
//                    description: Text("N'hésitez pas à enrichir cette région.")
//                )
//                .foregroundStyle(.whiteIvoryMist)
//            }
//        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    
    NavigationStack {
        DiscoverRegionView(selectedRegion: .auvergneRhoneAlpes)
            .environment(publicationManager)
    }
}
