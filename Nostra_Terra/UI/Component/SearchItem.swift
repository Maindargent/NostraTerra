//
//  SearchItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SearchItem: View {
    
    let publication: (any Publication)
    
    var body: some View {
        HStack(alignment: .top, spacing: 15){
            ZStack{
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.ultraThinMaterial)
                
                VStack (alignment: .leading){
                    AsyncImage(url: publication.image) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "photo")
                            .foregroundStyle(.blueDeepSpace)
                    }
                    .scaledToFill()
                    .frame(width: 140, height: 100)
                    .clipShape(.rect(cornerRadius: 5))
                    .padding(.top, 5)
                    
                    Text("Publié par : \(publication.author.firstName)")
                        .padding(.horizontal, 9)
                        .padding(.vertical, 3)
                        .glassEffect(.regular.tint(.blueDeepSpace.opacity(0.5)).interactive())
                        .font(.system(size: 8))
                        .foregroundStyle(.whiteIvoryMist)
                }
            }
            .frame(width: 150, height: 130)
            
            VStack(alignment: .leading){
                Text(publication.title)
                    .font(.system(size: 24, weight: .bold))
                    .lineLimit(1)
                Text(publication.description)
                    .lineLimit(3)
                    .font(.system(size: 14))
                
                
                
                ScrollView(.horizontal){
                    HStack{
                        Text(publication.region.titre)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 3)
                            .glassEffect(.clear.tint(publication.region.color))
                        
                        ForEach(publication.categories) { categorie in
                            Text(categorie.rawValue)
                                .padding(.horizontal, 9)
                                .padding(.vertical, 3)
                                .glassEffect(.clear.tint(categorie.color))
                        }
                        .foregroundStyle(.whiteIvoryMist)
                    }
                }
                .font(.system(size: 8))
            }
            .foregroundStyle(.whiteIvoryMist)
        }
        .frame(maxWidth: .infinity, idealHeight: 130, alignment: .topLeading)
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel(currentUser: users[0])
    
    SearchItem(publication: publicationManager.getRandomPublication())
}
