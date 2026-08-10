//
//  PublicationDetailView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI
import MapKit
import PhotosUI

enum TypeForm: String, CaseIterable {
    case event = "Événement"
    case tradition = "Tradition"
}

struct PublicationAddFormView: View {
    @State var formVM = FormPublicationVM()
    
    @State var showPicturePickerSheet: Bool  = false
    @State var showCategoriesSelectionSheet: Bool = false
    @State var showMapSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Image(.backgroundPicture)
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    //MARK: FIELD Type
                    PublicationTypeField(typeForm: $formVM.typeForm)
                    
                    
                    //MARK: FIELD : Titre
                    PublicationTitleField(title: $formVM.title)
                    
                    
                    //MARK: FIELD : Date
                    if formVM.typeForm == .event {
                        PublicationDateField(startDate: $formVM.startDate, endDate: $formVM.endDate)
                    }
                    
                    //MARK: FIELD Image
                    PublicationImageField(
                        showPicturePickerSheet: $showPicturePickerSheet, selectedItems: $formVM.selectedItems
                    )
                    
                    
                    //MARK: FIELD : Description
                    PublicationDescField(description: $formVM.description)
                    
                    //MARK: FIELD : Type
                    PublicationCategoriesField(
                        typeForm: $formVM.typeForm,
                        showCategoriesSelectionSheet: $showCategoriesSelectionSheet,
                        selectedCategories: $formVM.selectedCategories
                    )
                    
                    //MARK: FIELD : Région
                    PublicationRegionField(region: $formVM.region)
                    
                    
                    //MARK: FIELD : Coordonnées GPS
                    PublicationCoordField(
                        showMapSheet: $showMapSheet,
                        selectedGeoPoint: $formVM.selectedGeoPoint
                    )
                    
                    //MARK: Save button
                    Button {
                        //call vm for validation
                        //si valid : call publicationManager to add Publication
                    } label: {
                        Text("Mettre en ligne \(formVM.title)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.vertical, 6)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 12))
                    .tint(.yellowTuscanSun)
                    .padding(.top, 16)
                }
                .environment(formVM)
            }
            .scrollDismissesKeyboard(.immediately)
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Crée une publication")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
//    @Previewable @State var vm = FormPublicationVM()
    NavigationStack {
        PublicationAddFormView()
            .preferredColorScheme(.dark)
//            .environment(vm)
    }
}
