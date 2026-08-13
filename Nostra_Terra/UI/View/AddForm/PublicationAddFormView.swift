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
    @Environment(NotificationViewModel.self) var notificationViewModel
    
    @State var formVM = FormPublicationVM()
    
    @State var showPicturePickerSheet: Bool  = false
    @State var showCategoriesSelectionSheet: Bool = false
    @State var showMapSheet: Bool = false
    
    @State var isPublished: Bool = false
    
    @State var publishedPublication: (any Publication)?
    
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
                    PublicationTitleField()
                    
                    
                    //MARK: FIELD : Date
                    if formVM.typeForm == .event {
                        PublicationDateField()
                    }
                    
                    //MARK: FIELD Image
                    PublicationImageField(showPicturePickerSheet: $showPicturePickerSheet)
                
                    
                    //MARK: FIELD : Description
                    PublicationDescField()
                    
                    //MARK: FIELD : Type
                    PublicationCategoriesField(showCategoriesSelectionSheet: $showCategoriesSelectionSheet)
                    
                    //MARK: FIELD : Région
                    PublicationRegionField()
                    
                    
                    //MARK: FIELD : Coordonnées GPS
                    PublicationCoordField(showMapSheet: $showMapSheet)
                    
                    //MARK: Save button
                    Button {
                        guard let publication = formVM.getPublication else {return}
                        publicationsManager.addPublication(publication)
                        notificationViewModel.addNotification(
                            "Publication : \(publication.title) crée avec succée !",
                            type: .success
                        )
                        publishedPublication = publicationsManager.getPublication(id: publication.id)!
                        print("notification : \(notificationViewModel.currentNotif ?? nil)")
                        formVM.reset()
                        isPublished.toggle()
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
            .toolbar(content: {
                if formVM.isTitleValid {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            formVM.reset()
                        } label: {
                            HStack {
                                Text("Reset")
                                Image(systemName: "gobackward")
                            }.foregroundStyle(.red)
                        }
                    }
                }
                if formVM.isFormValid {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            guard let publication = formVM.getPublication else {return}
                            publicationsManager.addPublication(publication)
                            notificationViewModel.addNotification(
                                "Publication : \(publication.title) crée avec succée !",
                                type: .success
                            )
                            publishedPublication = publicationsManager.getPublication(id: publication.id)!
                            print("notification : \(notificationViewModel.currentNotif ?? nil)")
                            formVM.reset()
//                            isPublished.toggle()
                        } label: {
                            HStack {
                                Text("Enregistrer")
                                Image(systemName: "checkmark.circle")
                            }.foregroundStyle(.yellowTuscanSun)
                        }
                    }
                }
            })
            .scrollDismissesKeyboard(.immediately)
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Crée une publication")
            
        }
        .navigationDestination(isPresented: $isPublished, destination: {
            PublicationDetailView(
                publication: publishedPublication ?? MOCKED_PUBLICATIONS[0]
            )
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavigationStack {
        PublicationAddFormView()
            .environment(PublicationViewModel())
            .environment(NotificationViewModel())
    }
}
