//
//  PublicationDetailView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI
import MapKit

enum TypeForm: String, CaseIterable {
    case event = "Événements"
    case tradition = "Tradition"
}

struct PublicationAddFormView: View {
    @State var typeForm: TypeForm = .tradition
    @State var showCategoriesSelectionSheet: Bool = false
    @State var showMapSheet: Bool = false
    @State var selectedGeoPoint: CLLocationCoordinate2D?
    @State private var selectedCategories = Set<PublicationType>()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Image(.backgroundPicture)
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    //MARK: FIELD Type
                    Picker("Type de publication", selection: $typeForm) {
                        Text("Tradition").tag(TypeForm.tradition)
                        Text("Événements").tag(TypeForm.event)
                    }
                    .pickerStyle(.segmented)
                    
                    
                    //MARK: FIELD : Titre
                    VStack(alignment: .leading) {
                        Text("Titre")
                        TextField("Bigouden", text: .constant(""))
                            .padding()
                            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                    }
                    
                    
                    //MARK: FIELD : Date
                    if typeForm == .event {
                        VStack(alignment: .leading) {
                            DatePicker("Date de début",
                                       selection: .constant(.now),
                                       displayedComponents: .date
                            )
                            .datePickerStyle(.compact)
                            
                            DatePicker("Date de fin",
                                       selection: .constant(.now),
                                       displayedComponents: .date
                            )
                            .datePickerStyle(.compact)
                        }
                    }
                    
                    //MARK: FIELD Image
                    VStack(alignment: .leading) {
                        Text("Image")
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.clear)
                            .frame(width: .infinity, height: 50)
                            .glassEffect(.clear, in: ConcentricRectangle(corners: 12, isUniform: true))
                            .overlay(alignment: .center) {
                                Image(systemName: "photo.fill")
                                    .font(.title2)
                            }
                    }
                    
                    
                    //MARK: FIELD : Description
                    VStack(alignment: .leading) {
                        Text("Description")
                        TextEditor(text: .constant(""))
                            .frame(width: .infinity, height: 90)
                            .padding()
                            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                    }
                    
                    //MARK: FIELD : Type
                    Text("Sélectionner les catégories de la \(typeForm.rawValue.lowercased())")
                    
                    Button {
                        showCategoriesSelectionSheet.toggle()
                    } label: {
                        HStack {
                            Text("Sélectionner les catégories")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(systemName: "pointer.arrow.ipad.rays")
                        }
                        .foregroundStyle(.whiteIvoryMist)
                        .padding()
                        .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                    }
                    
                    LazyVGrid(columns: Array(
                        repeating: GridItem(.flexible(), spacing: 16),
                        count: 2
                    ), spacing: 16) {
                        ForEach(PublicationType.allCases) { category in
                            Button(category.rawValue) {
                                if selectedCategories.contains(category) {
                                    selectedCategories.remove(category)
                                } else {
                                    selectedCategories.insert(category)
                                }
                            }
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(selectedCategories.contains(category) ? category.color : .white)
                            .glassEffect(.regular.tint(selectedCategories.contains(category) ? category.color.opacity(0.2) : .clear))
                        }
                    }
                    
                    //MARK: FIELD : Région
                    VStack(alignment: .leading) {
                        Text("Région")
                        TextField("PACA", text: .constant(""))
                            .padding()
                            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                    }
                    
                    
                    //MARK: FIELD : Coordonnées GPS
                    VStack(alignment: .leading) {
                        Text("Emplacement GPS")
                        Button {
                            showMapSheet.toggle()
                        } label: {
                            HStack {
                                Text("Ouvrir la carte")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Image(systemName: "map.fill")
                            }
                            .foregroundStyle(.whiteIvoryMist)
                            .padding()
                            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                        }
                        if let selectedGeoPoint {
                            Text("Latitude : \(selectedGeoPoint.latitude)")
                            Text("Longitude : \(selectedGeoPoint.longitude)")
                        }
                    }
                }
            }
            .contentMargins(16, for: .scrollContent)
            .navigationTitle("Crée une publication")
            .sheet(isPresented: $showCategoriesSelectionSheet) {
                VStack {
                    List(selection: $selectedCategories) {
                        ForEach(PublicationType.allCases) { category in
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
                        .foregroundStyle(.ultraThickMaterial)
                        .padding()
                        .glassEffect(.regular.tint(.yellow), in: RoundedRectangle(cornerRadius: 12))
                    }

                }
                .presentationDragIndicator(.visible)
                .environment(\.editMode, .constant(.active))
                .presentationDetents([.medium])
            }
            .sheet(isPresented: $showMapSheet) {
                PublicationAddFormMapSheetView(showMapSheet: $showMapSheet, selectedGeoPoint: $selectedGeoPoint)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    RootView()
}
