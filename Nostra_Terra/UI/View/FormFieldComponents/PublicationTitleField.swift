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
    
    @FocusState private var isFieldFocused: Bool

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Titre")
            TextField("Bigouden", text: $title)
                .padding()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                .focused($isFieldFocused)
                .onChange(of: isFieldFocused) { oldValue, newValue in
                    if !isFieldFocused {
                        formVm.validate(title: title, )
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        PublicationAddFormView()
            .preferredColorScheme(.dark)
    }
}


