//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import MapKit


struct MapView: View {
    @Environment(PublicationViewModel.self) var publicationsManager
    @Environment(UserViewModel.self) var userViewModel
    
    @State var cameraPosition: MapCameraPosition = .automatic
    @State var userLocationOnAppear = CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0)
    
    @State var showPublicationSheet: Bool = false
    
    @State var selectedPublicationID: UUID? = nil
    var selectedPublication: (any Publication)? {
        guard let selectedPublicationID else {return nil}
        
        return publicationsManager.getPublication(id: selectedPublicationID)
    }
    
    let locationManager = CLLocationManager()
    
    
    @State var showFilterRegionSheet: Bool = false
    
    @State private var selectedCategory: PublicationCategory?
    @State private var selectedRegion: FrenchRegion?
    
    var body: some View {
        Map(
            position: $cameraPosition,
            selection: $selectedPublicationID
        ) {
            UserAnnotation()
            ForEach(publicationsManager.getFilteredPublications(region: selectedRegion, category: selectedCategory), id: \.id) { publication in
                Annotation(publication.title, coordinate: publication.geoPoint, anchor: .bottom) {
                    AsyncImage(url: publication.image) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(width: 45, height: 45)
                            .glassEffect()
                    }
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .background(
                        Circle().stroke(.whiteIvoryMist, lineWidth: 4)
                    )
                    .background(alignment: .bottom) {
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundStyle(.whiteIvoryMist)
                            .font(.system(size: 15))
                            .shadow(radius: 10)
                            .offset(x: 0, y: 10)
                    }
                }.tag(publication.id)
            }
        }
        .colorScheme(.dark)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .mapControls {
            MapUserLocationButton()
        }
        .onChange(of: selectedPublicationID) { _, publicationID in
            guard
                let publicationID,
                let publication = publicationsManager.getPublication(id: publicationID)
                    else {
                return
            }
            
            var region = MKCoordinateRegion(
                center: publication.geoPoint,
                latitudinalMeters: 100_000,
                longitudinalMeters: 100_000
            )
            
            region.center.latitude -= region.span.latitudeDelta * 0.80
            
            withAnimation(.smooth) {
                cameraPosition = .region(region)
                showPublicationSheet.toggle()
            }
        }
        .sheet(
            isPresented: $showPublicationSheet,
            onDismiss: {
                withAnimation(.smooth) {
                    cameraPosition = .automatic
                }
            },
            content: {
                PublicationDetailView(
                    publicationID: selectedPublicationID!
                ).environment(userViewModel)
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            selectedPublicationID = nil
                            showPublicationSheet.toggle()
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward")
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .buttonStyle(.glassProminent)
                        .glassEffect(.clear, in: .circle)
                    }
                    .sharedBackgroundVisibility(.hidden)
                })
                .presentationDragIndicator(.visible)
                .presentationDetents([.fraction(0.8), .large])
                .presentationBackground(.clear)
            }
        )
        .overlay(alignment: .topLeading) {
            HStack {
                Button {
                    showFilterRegionSheet.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .padding(12)
                }
                .buttonStyle(.glassProminent)
                .tint(.clear)
                .buttonBorderShape(.circle)
            }
            .padding()
        }
        .sheet(isPresented: $showFilterRegionSheet, content: {
            FilterPublicationView(
                selectedCategory: $selectedCategory,
                selectedRegion: $selectedRegion,
                showFilterRegionSheet: $showFilterRegionSheet
            )
            .presentationDetents([.fraction(0.4)])
            .presentationDragIndicator(.visible)
        })
        .onChange(of: selectedRegion) { oldValue, newValue in
            let showedPublication = publicationsManager.getFilteredPublications(
                region: selectedRegion,
                category: selectedCategory
            )
            
            if showedPublication.count == 1 {
                
                var region = MKCoordinateRegion(
                    center: showedPublication[0].geoPoint,
                    latitudinalMeters: 100_000,
                    longitudinalMeters: 100_000
                )
                
                withAnimation(.smooth) {
                    cameraPosition = .region(region)
                }
            } else {
                withAnimation(.smooth) {
                    cameraPosition = .automatic
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    @Previewable @State var userViewModel = UserViewModel(currentUser: users[0])
    MapView()
        .environment(publicationManager)
        .environment(userViewModel)
}
