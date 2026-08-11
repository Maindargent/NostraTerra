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
    @Environment(PublicationViewModel.self) var publicationsManager
    
    @State var formVM = FormPublicationVM()
    
    @State var showPicturePickerSheet: Bool  = false
    @State var showCategoriesSelectionSheet: Bool = false
    @State var showMapSheet: Bool = false
    
    @State var isPublished: Bool = false
    
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
                        guard let publication = formVM.getPublication else {return}
                        publicationsManager.addPublication(publication)
                        isPublished.toggle()
                        //TODO: ajouter un toast de notification pour valider le publish
                        formVM.reset()
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
                    .disabled(!formVM.isFormValid)
                    .contextMenu {
                        Button {
                            formVM.fillWithMockData()
                        } label: {
                            Text("Pré-remplir avec un Kebab")
                        }
                    }
                }
                .environment(formVM)
            }
            .scrollDismissesKeyboard(.immediately)
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Crée une publication")
            
        }
        .navigationDestination(isPresented: $isPublished, destination: {
            //TODO: modifie la tap bar pour avoir accée a la selection ici et pouvoir retourner a l'ecran d'acceuil
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    
    NavigationStack {
        PublicationAddFormView()
            .environment(publicationManager)
    }
}
