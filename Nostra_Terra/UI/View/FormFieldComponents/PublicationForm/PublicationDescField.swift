//
//  PublicationDescField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationDescField: View {
    @Environment(FormPublicationVM.self) var formVm
    @Binding var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .foregroundStyle(formVm.isDescriptionValid ? .white : .red)
            TextField("Tradtion de l'an 1999, ...", text: $description)
                .padding()
                .glassEffect(formVm.isDescriptionValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
        }
        
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    NavigationStack {
        PublicationAddFormView()
            .environment(publicationManager)
            .preferredColorScheme(.dark)
    }
}

