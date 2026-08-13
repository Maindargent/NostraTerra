//
//  PublicationTypeField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//

import SwiftUI

struct PublicationTypeField: View {
    @Binding var typeForm: TypeForm
    
    var body: some View {
        Picker("Type de publication", selection: $typeForm) {
            Text("Tradition").tag(TypeForm.tradition)
            Text("Événements").tag(TypeForm.event)
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    NavigationStack {
        PublicationAddFormView()
            .environment(PublicationViewModel())
            .environment(NotificationViewModel())
    }
}
