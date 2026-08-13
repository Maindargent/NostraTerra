//
//  PublicationDetailView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI
import MapKit
import PhotosUI

struct PublicationDetailView: View {
    @Environment(PublicationViewModel.self) var publicationsManager
    @Environment(UserViewModel.self) var userViewModel
    
    @State var cameraPosition: MapCameraPosition = .automatic
    
    let publicationID: UUID
    var publication: (any Publication)? {
        publicationsManager.getPublication(id: publicationID)
    }
    
    
    @State var item: PhotosPickerItem? = nil
    
    @State private var image: Image?
    @State private var isLoading = true
    
    var body: some View {
        if let publication {
            VStack {
                ZStack {
                    if !publication.uploadedImages.isEmpty {
                        HStack {
                            if let image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                            } else if isLoading {
                                ProgressView()
                            }
                        }
                        .onAppear(perform: {
                            item = publication.uploadedImages[0]
                        })
                        .task(id: item) {
                            if let item {
                                isLoading = true
                                image = try? await item.loadTransferable(type: Image.self)
                                isLoading = false
                            }
                        }
                    } else {
                        AsyncImage(url: publication.image) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .overlay(content: {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.black, .clear],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .clipped()
                })
                .overlay(alignment: .bottomLeading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(publication.title)
                                .foregroundStyle(.whiteIvoryMist)
                                .bold()
                                .font(.title)
                            Text(publication.created_at, format: .dateTime.locale(Locale(identifier: "fr_FR")) )
                                .foregroundStyle(.whiteIvoryMist)
                        }
                        Spacer()
                        Button {
                            userViewModel.toggleLike(
                                publication
                            )
                        } label: {
                            Image(
                                systemName:
                                    userViewModel.isLiked(
                                        publication
                                    )
                                ? "heart.fill"
                                : "heart"
                            )
                        }
                        .foregroundStyle(
                            userViewModel.isLiked(
                                publication
                            )
                            ? .yellowTuscanSun
                            : .whiteIvoryMist
                        )
                        .font(.title)
                    }
                    .padding()
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
                    .preferredColorScheme(.dark)
                    .mapStyle(.hybrid(elevation: .realistic, pointsOfInterest: .excludingAll, showsTraffic: true))
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
        } else {
            ContentUnavailableView("Aucune publication avec l'id : \(publicationID)", systemImage: "house")
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    @Previewable @State var userViewModel = UserViewModel(currentUser: users[0])
    
    PublicationDetailView(
        publicationID: publicationManager.getRandomPublication().id
    )
    .environment(publicationManager)
    .environment(userViewModel)
}

