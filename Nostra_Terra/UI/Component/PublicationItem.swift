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
                    .bold()
                    .font(.system(size: 16))
                
                Text(publication.region.rawValue)
                    .foregroundStyle(.whiteIvoryMist)
                    .font(.system(size: 12))
                
            }
            .lineLimit(1)
            .frame(maxWidth: 140)
            .padding(.bottom, 100)
            .padding(.leading, 5)
            
//            Text(publication.activity.rawValue)
//                .padding(.horizontal, 9)
//                .padding(.vertical, 3)
//                .glassEffect(.regular.tint(.yellowTuscanSun.opacity(0.7)).interactive())
//                .foregroundStyle(.whiteIvoryMist)
//                .padding(.trailing, 10)
//                .padding(.bottom, 10)


        }
        .foregroundStyle(.whiteIvoryMist)
    }
}

#Preview {
    PublicationItem(publication: publications[0])
}
