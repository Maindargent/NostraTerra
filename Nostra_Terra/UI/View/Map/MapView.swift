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
    
    @State var showPublicationSheet: Bool = false
    
    @State var selectedPublicationID: UUID? = nil
    var selectedPublication: (any Publication)? {
        guard let selectedPublicationID else {return nil}
        return publicationsManager.getPublication(id: selectedPublicationID)
    }
    
    @State var filterVM = FilterMapViewModel()
    
    var body: some View {
        Map(
            position: $cameraPosition,
            selection: $selectedPublicationID
        ) {
            UserAnnotation()
            ForEach(publicationsManager.getFilteredPublications(region: filterVM.selectedRegion, category: filterVM.selectedCategory), id: \.id) { publication in
                Annotation(publication.title, coordinate: publication.geoPoint, anchor: .bottom) {
                    CustomMapMarker(publication: publication)
                }.tag(publication.id)
            }
        }
        .colorScheme(.dark)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .mapControls {
            MapUserLocationButton()
        }
        //MARK: SELECTED PUBLICATION
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
                    publication: selectedPublication!
                )
                .environment(userViewModel)
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
        //MARK: FILTER BY REGION & CATEGORIES
        .overlay(alignment: .topLeading) {
            MapFilterOverlayView()
                .environment(filterVM)
        }
        //MARK: FILTER BY REGION
        .sheet(isPresented: $filterVM.showFilterRegionSheet, content: {
            MapFilterRegionSheetView(
                selectedCategory: $filterVM.selectedCategory,
                selectedRegion: $filterVM.selectedRegion,
                showFilterRegionSheet: $filterVM.showFilterRegionSheet
            )
            .presentationDetents([.fraction(0.4)])
            .presentationDragIndicator(.visible)
            .presentationBackground(.blueDeepSpace.gradient.opacity(0.5))
            .environment(filterVM)
        })
        .onChange(of: filterVM.selectedRegion) { oldValue, newValue in
            let showedPublication = publicationsManager.getFilteredPublications(
                region: filterVM.selectedRegion,
                category: filterVM.selectedCategory
            )
            
            if showedPublication.count == 1 {
                
                let region = MKCoordinateRegion(
                    center: showedPublication[0].geoPoint,
                    latitudinalMeters: 100_000,
                    longitudinalMeters: 100_000
                )
                
                withAnimation(.smooth) {
//                    filterVM.selectedCategory = nil
                    cameraPosition = .region(region)
                }
            } else {
                withAnimation(.smooth) {
//                    filterVM.selectedCategory = nil
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
