//
//  PublicationDescField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationDescField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    var body: some View {
        @Bindable var formVm = formVm
        
        VStack(alignment: .leading) {
            Text("Description")
                .foregroundStyle(formVm.isDescriptionValid ? .white : .red)
            TextField("Tradtion de l'an 1999, ...", text: $formVm.description)
                .padding()
                .glassEffect(formVm.isDescriptionValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
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

