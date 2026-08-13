//
//  PublicationTypeTag.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI
import MapKit
import PhotosUI

struct CustomMapMarker: View {
    let publication: (any Publication)
    
    @State var item: PhotosPickerItem? = nil
    
    @State private var image: Image?
    @State private var isLoading = true
    
    var body: some View {
        if !publication.uploadedImages.isEmpty {
            HStack {
                if let image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .background(
                            Circle().stroke(.whiteIvoryMist, lineWidth: 4)
                        )
                        .background(alignment: .bottom) {
                            Image(systemName: "arrowtriangle.down.fill")
                                .foregroundStyle(.whiteIvoryMist)
                                .font(.system(size: 15))
                                .shadow(radius: 10)
                                .offset(x: 0, y: 10)
                        }
                } else if isLoading {
                    ProgressView()
                }
            }
            .onAppear(perform: {
                item = publication.uploadedImages[0]
            })
            .task(id: item) {
                if let item {
                    isLoading = true
                    image = try? await item.loadTransferable(type: Image.self)
                    isLoading = false
                }
            }
        } else {
            AsyncImage(url: publication.image) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: 45, height: 45)
                    .glassEffect()
            }
            .scaledToFill()
            .frame(width: 45, height: 45)
            .clipShape(Circle())
            .background(
                Circle().stroke(.whiteIvoryMist, lineWidth: 4)
            )
            .background(alignment: .bottom) {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundStyle(.whiteIvoryMist)
                    .font(.system(size: 15))
                    .shadow(radius: 10)
                    .offset(x: 0, y: 10)
            }
        }
    }
}

struct TransferablePhotoMapMarkerView: View {
    let item: PhotosPickerItem
    
    @State private var image: Image?
    @State private var isLoading = true
    
    var body: some View {
        HStack {
            if let image {
                image
                    .resizable()
                    .scaledToFit()
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
    CustomMapMarker(publication: MOCKED_PUBLICATIONS[0])
}
