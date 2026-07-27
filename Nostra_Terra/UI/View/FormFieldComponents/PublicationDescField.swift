//
//  PublicationDescField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationDescField: View {
    @Binding var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
            TextField("Tradtion de l'an 1999, ...", text: $description)
                .padding()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
        }
        
    }
}

#Preview {
    @Previewable @State var description: String = ""
    PublicationDescField(
        description: $description
    )
}

