//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import MapKit
import CoreLocation


struct MapView: View {
    @State var selectedPublication: Publication? = nil
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State var userLocationOnAppear = CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0)

    
    let locationManager = CLLocationManager()
    
    
    var body: some View {
        Map(
//            initialPosition: .userLocation(fallback: .automatic),
            position: $cameraPosition,
            selection: $selectedPublication
        ) {
            UserAnnotation()
            ForEach(publications) { publication in
                Annotation(publication.title, coordinate: publication.geoPoint) {
                    AsyncImage(url: URL(string: publication.image)) { image in
                        image.resizable()
                    } placeholder: {
                        Image("placeholder").resizable()
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

            cameraPosition = .region(
                MKCoordinateRegion(
                    center: publication.geoPoint,
                    latitudinalMeters: 1_000,
                    longitudinalMeters: 1_000
                )
            )
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
        .sheet(item: $selectedPublication) { publication in
            ZStack {
                AsyncImage(url: URL(string: publication.image)) { image in
                    image.resizable()
                } placeholder: {
                    Image("placeholder").resizable()
                }
                .scaledToFill()
                .ignoresSafeArea()
                
                VStack() {
                    Spacer()
                    Button {
                        selectedPublication = nil
                    } label: {
                        Text(publication.title)
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(12)
                    }
                    .tint(.clear)
                    .buttonStyle(.glass)
                }
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.fraction(0.8)])
        }
    }
}


#Preview {
    MapView()
}
