//
//  PublicationRegionField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationRegionField: View {
    @Binding var region: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Région")
            TextField("PACA", text: .constant(""))
                .padding()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
        }
        
    }
}

#Preview {
    @Previewable @State var region: String = ""
    PublicationRegionField(
        region: $region
    )
}

