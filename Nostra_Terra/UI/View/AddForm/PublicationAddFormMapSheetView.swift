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
            }
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
        .overlay(alignment: .bottom) {
            HStack {
                Button {
                    showMapSheet = false
                } label: {
                    Text("Retour")
                        .foregroundStyle(.yellow)
                        .padding()
                        .glassEffect(
                            .regular,
                            in: RoundedRectangle(cornerRadius: 12)
                        )
                }

                Spacer()

                Button {
                    guard let tempGeoPoint else { return }

                    selectedGeoPoint = tempGeoPoint
                    showMapSheet = false
                } label: {
                    HStack {
                        Text("Valider")
                        Image(systemName: "pointer.arrow.ipad.rays")
                    }
                    .foregroundStyle(.ultraThickMaterial)
                    .padding()
                    .glassEffect(
                        .regular.tint(.yellow),
                        in: RoundedRectangle(cornerRadius: 12)
                    )
                }
                .disabled(tempGeoPoint == nil)
            }
            .padding(.horizontal)
            .padding(.bottom)
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
