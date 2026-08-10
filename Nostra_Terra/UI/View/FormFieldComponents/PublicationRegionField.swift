//
//  PublicationRegionField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationRegionField: View {
    @Environment(FormPublicationVM.self) var formVm
    @Binding var region: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Région")
                .foregroundStyle(formVm.isRegionValid ? .white : .red)
            TextField("PACA", text: .constant(""))
                .padding()
                .glassEffect(formVm.isRegionValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
            Picker("Région", selection: $region) {
                ForEach(RegionType.AllCases) { region in
                    Text(region).tag(region.id)
                }
            }
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

