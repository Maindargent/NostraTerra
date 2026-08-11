//
//  PublicationItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 03/08/2026.
//

import SwiftUI

struct PublicationItem: View {
    
    let publication: (any Publication)
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
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
                                    .glassEffect(.clear.tint(categorie.color))
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
    @Previewable @State var publicationManager =
           PublicationViewModel(
               currentUser: users[0]
           )
    
    PublicationItem(publication: publicationManager.getRandomPublication())
}
