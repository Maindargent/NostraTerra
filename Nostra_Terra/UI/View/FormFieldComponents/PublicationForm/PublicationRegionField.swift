//
//  PublicationRegionField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationRegionField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    var body: some View {
        @Bindable var formVm = formVm
        VStack(alignment: .leading) {
            Picker("Région", selection: $formVm.region) {
                if formVm.region == nil {
                    Text("Sélectionner une région").tag(nil as FrenchRegion?)
                }
                ForEach(FrenchRegion.allCases) { region in
                    Text(region.titre).tag(region)
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
    NavigationStack {
        PublicationAddFormView()
            .environment(PublicationViewModel())
            .environment(NotificationViewModel())
    }
}

