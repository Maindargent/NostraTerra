//
//  PublicationImageField.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 27/07/2026.
//
import SwiftUI
import PhotosUI

struct PublicationImageField: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(FormPublicationVM.self) var formVM
    
    @Binding var showPicturePickerSheet: Bool
    @Binding var selectedItems: [PhotosPickerItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Image")
                .foregroundStyle(formVM.isSelectedItemsValid ? .white : .red)
            Button {
                if selectedItems.count == 2 {
                    selectedItems.remove(at: 1)
                }
                showPicturePickerSheet.toggle()
            } label: {
                HStack {
                    Text("Ouvrir la galerie")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "photo")
                }
                .foregroundStyle(.whiteIvoryMist)
                .padding()
                .glassEffect(formVM.isSelectedItemsValid ? .clear : .clear.tint(.red.opacity(0.1)), in: RoundedRectangle(cornerRadius: 12))
            }
            if !selectedItems.isEmpty {
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 16) {
                        ForEach(selectedItems.enumerated(), id: \.element) { index, item in
                            TransferablePhotoView(item: item, selectedItems: $selectedItems, index: index)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showPicturePickerSheet) {
            ZStack(alignment: .bottomTrailing) {
                PhotosPicker(
                    "Photo picker",
                    selection: $selectedItems,
                    maxSelectionCount: 4,
                    selectionBehavior: .continuousAndOrdered,
                    matching: .images,
                )
                .tint(.yellowTuscanSun)
                .photosPickerStyle(.inline)
                .ignoresSafeArea()
                
                HStack {
                    Button {
                        showPicturePickerSheet.toggle()
                    } label: {
                        Text("Valider")
                            .padding(10)
                    }
                    .disabled(selectedItems.count < 1)
                    .tint(.yellowTuscanSun)
                    .buttonStyle(.glassProminent)
                    .padding(10)
                }
                .padding()
                
            }
            .presentationDetents([.medium, .large])
        }
        
    }
}

struct TransferablePhotoView: View {
    let item: PhotosPickerItem
    
    @Binding var selectedItems: [PhotosPickerItem]
    let index: Int
    
    @State private var image: Image?
    @State private var isLoading = true
    
    var body: some View {
        HStack {
            if let image {
                image
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .topTrailing) {
                        Button {
                            selectedItems.remove(at: index)
                        } label: {
                            Image(systemName: "multiply")
                                .foregroundStyle(.white)
                        }
                        .padding(10)
                        .glassEffect(.clear.tint(.red), in: .circle)
                        .padding(10)
                    }
                    .clipShape(ConcentricRectangle(corners: 22, isUniform: false))
                    .frame(maxWidth: 150, maxHeight: 250, alignment: .top)
            } else if isLoading {
                ProgressView()
            }
        }
        .frame(maxHeight: 140)
        .task(id: item) {
            isLoading = true
            image = try? await item.loadTransferable(type: Image.self)
            isLoading = false
        }
    }
}

#Preview {
//    @Previewable @State var showPicturePickerSheet: Bool = false
//    @Previewable @State var selectedItems: [PhotosPickerItem] = []
//    
//    PublicationImageField(
//        showPicturePickerSheet: $showPicturePickerSheet, selectedItems: $selectedItems
//    )
    
    PublicationAddFormView()
}

