//
//  PublicationDateField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationDateField: View {
    @Environment(FormPublicationVM.self) var formVm

    @Binding var startDate: Date
    @Binding var endDate: Date
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
///         MultiDatePicker("ouioui", selection: datesBinding)
///         https://stackoverflow.com/questions/79311919/select-date-of-range-between-two-dates-in-multidatepicker-swiftui
            
            DatePicker("Date de début",
                       selection: $startDate
            )
            .datePickerStyle(.compact)
            
            DatePicker("Date de fin",
                       selection: $endDate
            )
            .datePickerStyle(.compact)
            .foregroundStyle(formVm.isEndDateValid ? .white : .red)
        }
//        .onChange(of: endDate) {
//            if startDate > endDate {
//                startDate = Calendar.current.date(byAdding: .day, value: -7, to: startDate) ?? startDate
//            }
//        }
//        .onChange(of: startDate) {
//            if startDate > endDate {
//                endDate = Calendar.current.date(byAdding: .day, value: 7, to: startDate) ?? startDate
//            }
//        }
        
    }
    
    
}

#Preview {
//    @Previewable @State var startDate: Date = .now
//    @Previewable @State var endDate: Date = Calendar.current.date(byAdding: .day, value: 7, to: .now) ?? .now
//    
//    PublicationDateField(
//        startDate: $startDate,
//        endDate: $endDate
//    )
    
    PublicationAddFormView()
    
}

