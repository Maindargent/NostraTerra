//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import MapKit


struct MapView: View {
    @State var selectedPublication: (any Publication)? = nil
//    @State var selectedPublication: Event? = nil
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State var userLocationOnAppear = CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0)

    
    let locationManager = CLLocationManager()
    
    
    var body: some View {
        Map(
            position: $cameraPosition
        ) {
            UserAnnotation()
            ForEach(events, id: \.id) { publication in
                
                
                if type(of: publication) == Tradition {
                    let tradition = Tradition(image: publication.image, uploadedImages: [], title: publication.title, description: publication.description, created_at: publication.created_at, categories: publication.categories, region: publication.region, author: publication.author, geoPoint: publication.geoPoint, likeCount: publication.likeCount)
                } else {
                    let event = Event(image: publication.image, uploadedImages: [], title: publication.title, description: publication.description, created_at: publication.created_at, categories: publication.categories, region: publication.region, author: publication.author, geoPoint: publication.geoPoint, likeCount: publication.likeCount, startDate: publication.startDate, endDate: publication.endDate)
                }
                
                
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
                }.tag(publication)
            }
        }
        .mapControls {
            MapUserLocationButton()
        }
        .onChange(of: selectedPublication) { _, publication in
            guard let publication else {
                return
            }
            
            var region = MKCoordinateRegion(
                center: publication.geoPoint,
                latitudinalMeters: 100_000,
                longitudinalMeters: 100_000
            )

            region.center.latitude -= region.span.latitudeDelta * 0.80

            withAnimation(.spring) {
                cameraPosition = .region(region)
            }
        }
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(
            item: $selectedPublication,
            onDismiss: {
                withAnimation(.smooth) {
                    cameraPosition = .automatic
                }
            }
        ) { publication in
//            PublicationDetailView(
//                publication: publication,
//                selectedPublication: $selectedPublication
//            )
        }
    }
}


#Preview {
    MapView()
}
