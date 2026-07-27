//
//  PublicationTitleField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationTitleField: View {
    @Binding var title: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Titre")
            TextField("Bigouden", text: $title)
                .padding()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    @Previewable @State var title: String = ""
    PublicationTitleField(
        title: $title
    )
}


