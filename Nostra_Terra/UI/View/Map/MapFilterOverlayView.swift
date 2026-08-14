//
//  MapFilterCategoryView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 13/08/2026.
//
import SwiftUI

struct MapFilterOverlayView: View {
    @Environment(FilterMapViewModel.self) var filterVM: FilterMapViewModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading) {
                if filterVM.showFilterCategories {
                    VStack(alignment: .leading) {
                        
                        Button {
                            withAnimation {
                                filterVM.selectedCategory = nil
                                filterVM.showFilterCategories.toggle()
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Text("Toutes")
                                    .foregroundStyle(.white)
                                    .padding(4)
                            }
                        }
                        .padding(4)
                        .foregroundStyle(.white)
                        
                        ForEach(PublicationCategory.allCases) { cat in
                            Button {
                                withAnimation {
//                                    filterVM.selectedRegion = nil
                                    filterVM.selectedCategory = cat
                                    filterVM.showFilterCategories.toggle()
                                }
                            } label: {
                                HStack(spacing: 6) {
                                    Text(cat.rawValue)
                                        .foregroundStyle(.white)
                                        .padding(4)
                                    if filterVM.selectedCategory == cat {
                                        Image(systemName: "checkmark")
                                    }
                                }
                                .padding(4)
                                .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding(8)
                } else {
                    Button {
                        withAnimation {
                            filterVM.showFilterCategories.toggle()
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Text("\(filterVM.selectedCategory?.rawValue ?? "Catégories")")
                            if (filterVM.selectedCategory != nil) {
                                Button {
                                    withAnimation(.smooth) {
                                        filterVM.selectedCategory = nil
                                    }
                                } label : {
                                    Image(systemName: "multiply")
                                }
                            } else {
                                Image(systemName: "line.3.horizontal.decrease")
                            }
                        }
                        .foregroundStyle(filterVM.selectedCategory != nil ? filterVM.selectedCategory!.color : .white)
                    }
                    .padding(filterVM.selectedCategory != nil ? 16 : 12)
                }
            }
            .glassEffect(.regular, in: .rect(cornerRadius: 24))
            
            Button {
                filterVM.showFilterRegionSheet.toggle()
            } label: {
                HStack(spacing: 6) {
                    Text("\(filterVM.selectedRegion?.titre ?? "Régions")")
                    if (filterVM.selectedRegion != nil) {
                        Button {
                            withAnimation(.smooth) {
                                filterVM.selectedRegion = nil
                            }
                        } label : {
                            Image(systemName: "multiply")
                        }
                    } else {
                        Image(.franceIcon)
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                }
                .foregroundStyle(filterVM.selectedRegion != nil ? filterVM.selectedRegion!.color : .white)
                .tint(filterVM.selectedRegion != nil ? filterVM.selectedRegion!.color : .white)
                .padding(filterVM.selectedRegion != nil ? 8 : 4)
            }
            .buttonStyle(.glassProminent)
            .tint(.clear)
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    @Previewable @State var userViewModel = UserViewModel(currentUser: users[0])
    MapView()
        .environment(publicationManager)
        .environment(userViewModel)
}


