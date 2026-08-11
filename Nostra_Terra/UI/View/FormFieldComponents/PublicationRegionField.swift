//
//  PublicationRegionField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationRegionField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    @Binding var region: FrenchRegion?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker("Région", selection: $region) {
                if region == nil {
                    Text("Sélectionner une région").tag(nil as String?)
                }
                ForEach(FrenchRegion.allCases) { region in
                    Text(region.titre).tag(region.rawValue)
                }
            }
            .tint(formVm.isRegionValid ? .white : .red)
            .pickerStyle(.navigationLink)
            .frame(maxWidth: .infinity)
            .padding(14)
            .glassEffect(formVm.isRegionValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
        }
        
    }
}

#Preview {
    //    @Previewable @State var region: String = ""
    //    PublicationRegionField(
    //        region: $region
    //    )
    NavigationStack {
        PublicationAddFormView()
            .preferredColorScheme(.dark)
    }
}

