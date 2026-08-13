//
//  PublicationCoordField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI
import MapKit

struct PublicationCoordField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    @Binding var showMapSheet: Bool
    
    var body: some View {
        @Bindable var formVm = formVm
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Emplacement GPS")
                .foregroundStyle(formVm.isSelectedGeoPointValid ? .white : .red)
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
                .glassEffect(formVm.isSelectedGeoPointValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
            }
            if let geoPoint = formVm.selectedGeoPoint {
                Text("Latitude : \(geoPoint.latitude)")
                Text("Longitude : \(geoPoint.longitude)")
            }
        }
        .sheet(isPresented: $showMapSheet) {
            PublicationAddFormMapSheetView(showMapSheet: $showMapSheet, selectedGeoPoint: $formVm.selectedGeoPoint)
                .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    NavigationStack {
        PublicationAddFormView()
            .environment(PublicationViewModel())
            .environment(NotificationViewModel())
    }
}

