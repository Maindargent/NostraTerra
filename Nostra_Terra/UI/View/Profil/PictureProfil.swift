//
//  PictureProfil.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 12/08/2026.
//
import SwiftUI
import PhotosUI

struct PictureProfil: View {
    
    @State var item: PhotosPickerItem? = nil
    @State private var image: Image?
    @State private var isLoading = true
    
    let picture: PhotosPickerItem
    
    var body: some View {
        HStack {
            if let image {
                image
                    .resizable()
                    .frame(width: 115, height: 115)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.whiteIvoryMist, lineWidth: 2)
                    }
                    .foregroundStyle(.whiteIvoryMist)
            } else if isLoading {
                ProgressView()
            }
        }
        .onAppear(perform: {
            item = picture
        })
        .task(id: item) {
            if let item {
                isLoading = true
                image = try? await item.loadTransferable(type: Image.self)
                isLoading = false
            }
        }
    }
}
