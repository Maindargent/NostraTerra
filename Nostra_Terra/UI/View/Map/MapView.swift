//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import MapKit


struct MapView: View {
    @State var selectedPublicationID: UUID? = nil
    
    @State var cameraPosition: MapCameraPosition = .automatic
    @State var userLocationOnAppear = CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0)
    
    @State var showPublicationSheet: Bool = false
    
    
    let locationManager = CLLocationManager()
    
    var selectedPublication: (any Publication)? {
        guard let selectedPublicationID else {return nil}
        
        return publications.first{$0.id == selectedPublicationID}
    }
    
    
    var body: some View {
        Map(
            position: $cameraPosition,
            selection: $selectedPublicationID
        ) {
            UserAnnotation()
            ForEach(publications, id: \.id) { publication in
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .mapControls {
            MapUserLocationButton()
        }
        .onChange(of: selectedPublicationID) { _, publicationID in
            guard
                let publicationID,
                let publication = publications.first(where: { $0.id == publicationID })
            else {
                print("oyu")
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
                    publication: selectedPublication!,
                    onClose: {
                        selectedPublicationID = nil
                    }
                )
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
            }
        )
        
        .onAppear {
//            locationManager.requestWhenInUseAuthorization()
//            guard let userLocation = locationManager.location?.coordinate else {return}
//            userLocationOnAppear = userLocation
//            cameraPosition = .region(
//                MKCoordinateRegion(
//                    center: userLocation,
//                    latitudinalMeters: 100_000,
//                    longitudinalMeters: 100_000
//                )
//            )
        }
    }
}


#Preview {
    MapView()
}
