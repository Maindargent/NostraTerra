//
//  PublicationCategoriesField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI

struct PublicationCategoriesField: View {
    @Binding var typeForm: TypeForm
    @Binding var showCategoriesSelectionSheet: Bool
    @Binding var selectedCategories: Set<PublicationCategory>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Sélectionner les catégories de \(typeForm == .tradition ? "la " : "l'")\(typeForm.rawValue.lowercased())")
            
            Button {
                showCategoriesSelectionSheet.toggle()
            } label: {
                HStack {
                    Text("Sélectionner les catégories de \(typeForm == .tradition ? "la " : "l'")\(typeForm.rawValue.lowercased())")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(.iconCursorClick)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .foregroundStyle(.whiteIvoryMist)
                .padding()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
            }
            .sheet(isPresented: $showCategoriesSelectionSheet) {
                VStack {
                    List(selection: $selectedCategories) {
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
            
//            LazyVGrid(columns: Array(
//                repeating: GridItem(.flexible(), spacing: 12),
//                count: 2
//            ), spacing: 12) {
//                ForEach(PublicationType.allCases) { category in
//                    Button(category.rawValue) {
//                        withAnimation(.easeInOut(duration: 0.25)){
//                            if selectedCategories.contains(category) {
//                                selectedCategories.remove(category)
//                            } else {
//                                selectedCategories.insert(category)
//                            }
//                        }
//                    }
//                    .padding()
//                    .lineLimit(1)
//                    .minimumScaleFactor(0.7)
//                    .frame(maxWidth: .infinity)
//                    .foregroundStyle(selectedCategories.contains(category) ? category.color : .white)
//                    .glassEffect(.regular.tint(selectedCategories.contains(category) ? category.color.opacity(0.2) : .clear), in: .rect(cornerRadius: 12, style: .continuous))
//                }
//            }
        }
        
    }
}

#Preview {
    
    @Previewable @State var typeForm: TypeForm = .event
    @Previewable @State var showCategoriesSelectionSheet: Bool = false
    @Previewable @State var selectedCategories = Set<PublicationCategory>()
    
    PublicationCategoriesField(
        typeForm: $typeForm,
        showCategoriesSelectionSheet: $showCategoriesSelectionSheet,
        selectedCategories: $selectedCategories
    )
}

