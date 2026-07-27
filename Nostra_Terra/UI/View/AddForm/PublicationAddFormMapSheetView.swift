//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//

import SwiftUI
import MapKit
import CoreLocation

struct PublicationAddFormMapSheetView: View {
    @Binding var showMapSheet: Bool
    @Binding var selectedGeoPoint: CLLocationCoordinate2D?

    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var tempGeoPoint: CLLocationCoordinate2D?

    var body: some View {
        MapReader { proxy in
            Map(position: $cameraPosition) {
                UserAnnotation()

                if let tempGeoPoint {
                    Marker("Ici", coordinate: tempGeoPoint)
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapScaleView()
                MapCompass()
                MapPitchToggle()
               
            }
            .buttonBorderShape(.circle)
            .tint(.yellowTuscanSun)
            .onTapGesture { position in
                tempGeoPoint = proxy.convert(position, from: .local)
            }
        }
        .onAppear {
            tempGeoPoint = selectedGeoPoint

            if let selectedGeoPoint {
                cameraPosition = .region(
                    MKCoordinateRegion(
                        center: selectedGeoPoint,
                        latitudinalMeters: 10_000,
                        longitudinalMeters: 10_000
                    )
                )
            } else {
                cameraPosition = .userLocation(fallback: .automatic)
            }
        }
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading) {
                if let tempGeoPoint {
                    VStack(alignment: .leading) {
                        Text("Latitude : \(tempGeoPoint.latitude)")
                        Text("Longitude : \(tempGeoPoint.longitude)")
                    }
                    .foregroundStyle(.yellow)
                    .padding(12)
                    .glassEffect(
                        .regular,
                        in: RoundedRectangle(cornerRadius: 12)
                    )
                }
                Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        showMapSheet = false
                    } label: {
                        Text("Retour")
    //                        .foregroundStyle(.yellow)
                            .padding(4)
    //                        .glassEffect(
    //                            .regular,
    //                            in: RoundedRectangle(cornerRadius: 12)
    //                        )
                    }
                    .buttonStyle(.glass)
                    .tint(.yellowTuscanSun)


                    Button {
                        guard let tempGeoPoint else { return }

                        selectedGeoPoint = tempGeoPoint
                        showMapSheet = false
                    } label: {
                        HStack {
                            Text("Valider")
                            Image(systemName: "pointer.arrow.ipad.rays")
                        }
    //                    .foregroundStyle(.ultraThickMaterial)
                        .padding(4)
    //                    .glassEffect(
    //                        .regular.tint(.yellow),
    //                        in: RoundedRectangle(cornerRadius: 12)
    //                    )
    //                    .tint(.ultraThickMaterial)
    //                    .buttonStyle(.borderedProminent)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.yellowTuscanSun)
                    .disabled(tempGeoPoint == nil)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    @Previewable @State var showMapSheet = true
    @Previewable @State var selectedGeoPoint: CLLocationCoordinate2D?
    
    PublicationAddFormMapSheetView(
        showMapSheet: $showMapSheet,
        selectedGeoPoint: $selectedGeoPoint
    )
}
