//
//  FilterPublicationView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 31/07/2026.
//

import SwiftUI


struct FilterPublicationView: View {
    @Environment(PublicationViewModel.self) var publicationManager: PublicationViewModel
    
    @Binding var selectedCategory: PublicationCategory?
    @Binding var selectedRegion: FrenchRegion?
    @Binding var showFilterRegionSheet: Bool
    
    var body: some View {
//        HStack{
//            Menu{
//                ForEach(PublicationCategory.allCases, id: \.self) { category in
//                    Button(category.rawValue){
//                        selectedCategory = category
//                    }.tag(category)
//                }
//            } label: {
//                Image(systemName: "line.3.horizontal.decrease.circle")
//            }
//        }
        
        Picker("Appearance", selection: $selectedRegion) {
            Text("Toutes les regions").tag(nil as FrenchRegion?)
            ForEach(publicationManager.getUsedRegions(), id: \.region.id) { region in
                Text(region.region.titre).tag(region.region)
            }
        }
        .pickerStyle(.wheel)
        
        Button {
            showFilterRegionSheet.toggle()
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
    @Previewable @State var selectedCategory: PublicationCategory?
    @Previewable @State var selectedRegion: FrenchRegion?
    @Previewable @State var showFilterRegionSheet: Bool = false
    
    FilterPublicationView(selectedCategory: $selectedCategory, selectedRegion: $selectedRegion, showFilterRegionSheet: $showFilterRegionSheet)
        .environment(publicationManager)
}
