//
//  FilterPublicationView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 31/07/2026.
//

import SwiftUI


struct FilterPublicationView: View {
    @State private var selectedType: PublicationType = .tous
    @State private var selectedRegion: RegionType = .toutes
    
    var filteredActivity: [Event]{
        if selectedType == .tous {
            return events
        } else {
            return events.filter{ $0.activity ==  selectedType }
        }
    }
    
    var body: some View {
//                HStack{
//                    Menu{
//                        ForEach(PublicationType.allCases, id: \.self) { type in
//                            Button(type.rawValue){
//                                selectedType = type
//                            }
//                        }
//                    } label: {
//                        Image(systemName: "line.3.horizontal.decrease.circle")
//                    }
//                }
        
        VStack{
            Form {
                Section ("Types"){
                    Picker("Appearance", selection: $selectedType) {
                        ForEach(PublicationType.allCases, id: \.self) {
                            type in
                            Button(type.rawValue) {
                                selectedType = type
                            }
                        }
                    }
                }
                .pickerStyle(.wheel)
                Section ("Région"){
                    Picker("Appearance", selection: $selectedRegion) {
                        ForEach(RegionType.allCases, id: \.self) {
                            region in
                            Button(region.rawValue) {
                                selectedRegion = region
                            }
                        }
                    }
                }
                .pickerStyle(.wheel)
            }
            
        }
    }
}

#Preview {
    FilterPublicationView()
}
