//
//  FilterPublicationView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 31/07/2026.
//

import SwiftUI


struct MapFilterRegionSheetView: View {
    @Environment(PublicationViewModel.self) var publicationManager: PublicationViewModel
    @Environment(FilterMapViewModel.self) var filterVM: FilterMapViewModel
    
    var body: some View {
        @Bindable var filterVM = filterVM
        Picker("Appearance", selection: $filterVM.selectedRegion) {
            Text("Toutes les regions").tag(nil as FrenchRegion?)
                .foregroundStyle(filterVM.selectedRegion != nil ? .whiteIvoryMist : .yellowTuscanSun)
            ForEach(publicationManager.getUsedRegions(), id: \.region.id) { region in
                Text(region.region.titre).tag(region.region)
                    .foregroundStyle(filterVM.selectedRegion != region.region ? .whiteIvoryMist : .yellowTuscanSun)
            }
        }
        .pickerStyle(.wheel)
        
        Button {
            filterVM.showFilterRegionSheet.toggle()
        } label: {
            Text("Valider")
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.glassProminent)
        .tint(.yellowTuscanSun)
        .buttonBorderShape(.roundedRectangle(radius: 12))
        .padding()
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    @Previewable @State var userViewModel = UserViewModel(currentUser: users[0])
    MapView()
        .environment(publicationManager)
        .environment(userViewModel)}
