//
//  PublicationCategoriesField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationCategoriesField: View {
    @Environment(FormPublicationVM.self) var formVm
    
    @Binding var showCategoriesSelectionSheet: Bool
    
    var body: some View {
        @Bindable var formVm = formVm
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Sélectionner les catégories de \(formVm.typeForm == .tradition ? "la " : "l'")\(formVm.typeForm.rawValue.lowercased())")
                .foregroundStyle(formVm.isSelectedCategoriesValid ? .white : .red)
            
            Button {
                showCategoriesSelectionSheet.toggle()
            } label: {
                HStack {
                    Text("Sélectionner les catégories de \(formVm.typeForm == .tradition ? "la " : "l'")\(formVm.typeForm.rawValue.lowercased())")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "pointer.arrow.ipad.rays")
                }
                .foregroundStyle(.whiteIvoryMist)
                .padding()
                .glassEffect(formVm.isSelectedCategoriesValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
            }
            .sheet(isPresented: $showCategoriesSelectionSheet) {
                VStack {
                    List(selection: $formVm.selectedCategories) {
                        ForEach(PublicationCategory.allCases) { category in
                            Text(category.rawValue)
                                .foregroundStyle(category.color)
                        }
                    }
                    
                    Button {
                        showCategoriesSelectionSheet.toggle()
                    } label: {
                        HStack {
                            Text("Valider")
                            Image(systemName: "pointer.arrow.ipad.rays")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .padding(10)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.yellowTuscanSun)
                    

                }
                .presentationDragIndicator(.visible)
                .environment(\.editMode, .constant(.active))
                .presentationDetents([.medium])
            }
            
            //TODO: remove "tous" from Categories Enum
            
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(Array(formVm.selectedCategories), id: \.id) { category in
                        Button {
                        } label: {
                            Text(category.rawValue)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(category.color.opacity(0.1))
                    }
                }
            }
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

