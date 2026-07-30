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
//    Type
    @State var typeForm: TypeForm = .tradition
//    Titre
    @State var title: String = ""
//    Date
    @State var startDate: Date = .now
    @State var endDate: Date = .now
//    Image
    @State var showPicturePickerSheet: Bool  = false
    @State var selectedItems: [PhotosPickerItem] = []
//    Description
    @State var description: String = ""
//    Type
    @State var selectedCategories = Set<PublicationCategory>()
//    Région
    @State var region: String = ""
//    Coordonnées
    @State var selectedGeoPoint: CLLocationCoordinate2D?
    
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
                    PublicationTypeField(typeForm: $typeForm)
                    
                    
                    //MARK: FIELD : Titre
                    PublicationTitleField(title: $title)
                    
                    
                    //MARK: FIELD : Date
                    if typeForm == .event {
                        PublicationDateField(startDate: $startDate, endDate: $endDate)
                    }
                    
                    //MARK: FIELD Image
                    PublicationImageField(
                        showPicturePickerSheet: $showPicturePickerSheet, selectedItems: $selectedItems
                    )
                    
                    
                    //MARK: FIELD : Description
                    PublicationDescField(description: $description)
                    
                    //MARK: FIELD : Type
                    PublicationCategoriesField(
                        typeForm: $typeForm,
                        showCategoriesSelectionSheet: $showCategoriesSelectionSheet,
                        selectedCategories: $selectedCategories
                    )
                    
                    //MARK: FIELD : Région
                    PublicationRegionField(region: $region)
                    
                    
                    //MARK: FIELD : Coordonnées GPS
                    PublicationCoordField(
                        showMapSheet: $showMapSheet,
                        selectedGeoPoint: $selectedGeoPoint
                    )
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Crée une publication")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    RootView()
}
