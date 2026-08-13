//
//  PublicationItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 03/08/2026.
//

import SwiftUI
import PhotosUI

struct PublicationItem: View {
    
    let publication: (any Publication)
    
    
    @State var item: PhotosPickerItem? = nil
    
    @State private var image: Image?
    @State private var isLoading = true
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if !publication.uploadedImages.isEmpty {
                HStack {
                    if let image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.grayLines, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
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
                    Image(systemName: "photo")
                        .foregroundStyle(.blueDeepSpace)
                }
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(.rect(cornerRadius: 5))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.grayLines, lineWidth: 1)
                )
                .padding(.bottom, 5)
            }
            
            
            VStack(alignment: .leading){
                Text(publication.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.whiteIvoryMist)
                    .lineLimit(1)
                    .shadow(
                            color: .black,
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                
                Text(publication.region.titre)
                    .foregroundStyle(.whiteIvoryMist)
                    .font(.system(size: 12))
                    .shadow(
                            color: .black,
                            radius: 2,
                            x: 1,
                            y: 1
                        )
                
                Spacer()
                
                VStack{
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(publication.categories) { categorie in
                                Text(categorie.rawValue)
                                    .padding(.horizontal, 9)
                                    .padding(.vertical, 3)
                                    .font(.system(size: 10))
                                    .glassEffect(.clear.tint(categorie.color.opacity(0.5)))
                            }
                            .foregroundStyle(.whiteIvoryMist)
                            .padding(.bottom, 10)
                            
                        }
                    }
                    
                }
            }
            .padding(.horizontal, 9)
            .padding(.vertical, 3)
            .frame(width: 150, height: 150, alignment: .topLeading)
            
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    
    PublicationItem(publication: publicationManager.getRandomPublication())
}
