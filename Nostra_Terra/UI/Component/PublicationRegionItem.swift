//
//  PublicationRegionItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct PublicationRegionItem: View {
    
    let publication: Publication
    @Binding var showListSuggestion: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: publication.image)) { image in
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
                    .foregroundStyle(.whiteIvoryMist)
                
                Text(publication.region)
                    .foregroundStyle(.whiteIvoryMist)
                    .font(.system(size: 12))
                
            }
            .padding(.bottom, 100)
                
                Button{
                    showListSuggestion = true
                } label : {
                    Text("Je découvre")
                }
                .foregroundStyle(.white)
                .font(.system(size: 14))
                .padding(10)
                .glassEffect(.regular.tint(.yellowTuscanSun.opacity(0.7)).interactive())
                .padding(.trailing,40)
                .padding(.bottom,10)
        }
    }
}

#Preview {
    PublicationRegionItem(publication: publications[0], showListSuggestion: .constant(true))
}
