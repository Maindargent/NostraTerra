//
//  PublicationTitleField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationTitleField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    @Binding var title: String

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Titre")
                .foregroundStyle(formVm.isTitleValid ? .white : .red)
            TextField("Bigouden", text: $title)
                .padding()
                .glassEffect(formVm.isTitleValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
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


