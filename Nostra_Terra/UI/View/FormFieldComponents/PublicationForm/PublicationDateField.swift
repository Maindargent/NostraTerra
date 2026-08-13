//
//  PublicationDateField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationDateField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    var body: some View {
        @Bindable var formVm = formVm
        
        VStack(alignment: .leading) {
            DatePicker("Date de début",
                       selection: $formVm.startDate
            )
            .datePickerStyle(.compact)
            
            DatePicker("Date de fin",
                       selection: $formVm.endDate
            )
            .datePickerStyle(.compact)
            .foregroundStyle(formVm.isEndDateValid ? .white : .red)
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

