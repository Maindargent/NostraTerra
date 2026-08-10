//
//  PublicationDetailView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI
import MapKit

struct PublicationDetailView: View {
    let publication: (any Publication)
    //    let colorType: PublicationType = .artVisuel
    @State var cameraPosition: MapCameraPosition = .automatic
    
    var body: some View {
        VStack{
            ZStack(alignment: .leading) {
                AsyncImage(url: publication.image) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .cornerRadius(20)
                } placeholder: {
                    ProgressView()
                }
//                .ignoresSafeArea()
//                .clipped()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(content: {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.black, .clear],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                   //     .frame(maxHeight: .infinity)
                        .clipped()
                        .cornerRadius(20)
                })
                .overlay(alignment: .bottomLeading) {
                    
                    VStack(alignment: .leading) {
                        Text(publication.title)
                            .foregroundStyle(.whiteIvoryMist)
                            .bold()
                            .font(.title)
                        
                        
                        Text(publication.created_at, format: .dateTime.locale(Locale(identifier: "fr_FR")) )
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    .padding(.horizontal)
                }
         
            }
            
            ScrollView {
                ScrollView(.horizontal) {
                    HStack() {
                        Text(publication.region.titre)
                            .foregroundStyle(.whiteIvoryMist)
                            .padding(5)
                            .glassEffect(.clear.tint(publication.region.color))
                        
                        ForEach(publication.categories) { categorie in
                            Text(categorie.rawValue)
                                .foregroundStyle(.whiteIvoryMist)
                                .padding(5)
                                .glassEffect(.clear.tint(categorie.color))
                        }
                        
                    }
                }
                .contentMargins(8, for: .scrollContent)
                
                Text(publication.description)
                    .foregroundStyle(.whiteIvoryMist)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
//                Rectangle()
                Map(position: $cameraPosition, content: {
                    Marker(publication.title, coordinate: publication.geoPoint)
                })
                .onAppear {
                    cameraPosition = .region(
                        MKCoordinateRegion(
                            center: publication.geoPoint,
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.01,
                                longitudeDelta: 0.01
                            )
                        )
                    )
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .frame(height: 200)
            }
            .padding()
        }
        .ignoresSafeArea()
        .background {
            Image(.backgroundPicture)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    
    PublicationDetailView(publication: publicationManager.getRandomPublication())
}
