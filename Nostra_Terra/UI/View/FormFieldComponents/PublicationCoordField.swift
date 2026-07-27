//
//  PublicationCoordField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI
import MapKit

struct PublicationCoordField: View {
    @Binding var showMapSheet: Bool
    @Binding var selectedGeoPoint: CLLocationCoordinate2D?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Emplacement GPS")
            Button {
                showMapSheet.toggle()
            } label: {
                HStack {
                    Text("Ouvrir la carte")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "map.fill")
                }
                .foregroundStyle(.whiteIvoryMist)
                .padding()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
            }
            if let selectedGeoPoint {
                Text("Latitude : \(selectedGeoPoint.latitude)")
                Text("Longitude : \(selectedGeoPoint.longitude)")
            }
        }
        .sheet(isPresented: $showMapSheet) {
            PublicationAddFormMapSheetView(showMapSheet: $showMapSheet, selectedGeoPoint: $selectedGeoPoint)
                .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    @Previewable @State var showMapSheet: Bool = false
    @Previewable @State var selectedGeoPoint: CLLocationCoordinate2D?
    
    PublicationCoordField(
        showMapSheet: $showMapSheet,
        selectedGeoPoint: $selectedGeoPoint
    )
}

