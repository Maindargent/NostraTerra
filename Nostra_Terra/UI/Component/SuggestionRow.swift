//
//  SuggestionRow.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SuggestionRow: View {
    
    let publication: Publication
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                ZStack{
                    AsyncImage(url: URL(string: publication.image)) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "photo")
                            .foregroundStyle(.blueDeepSpace)
                    }
                    .scaledToFill()
                    .frame(width: 300, height: 175)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 20,
                            topTrailingRadius: 20
                        )
                    )
                    .padding(.bottom, 5)
                    
                    ZStack{
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [.black, .clear],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .frame(width: 300, height: 60)
                        
                        HStack(spacing: 100){
                            VStack(alignment: .leading){
                                Text(publication.title)
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundStyle(.whiteIvoryMist)
                                
                                HStack{
                                    Text("00/00/0000")
                                        .foregroundStyle(.whiteIvoryMist)
                                    
                                    Text(publication.region)
                                        .foregroundStyle(.whiteIvoryMist)
                                }
                                .font(.system(size: 12))
                                
                            }
                            
                            Button{
                                
                            } label : {
                                Image(systemName: "arrow.right")
                            }
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                            .padding(10)
                            .glassEffect(.regular.tint(.blueDeepSpace).interactive(), in: .circle)
                        }
                    }
                    .padding(.top, 110)
                }
                
                Text("\n\n\n\n\n\n")
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.thickMaterial)
                    .shadow(radius: 20)
            )
        }
    }
}

#Preview {
    SuggestionRow(publication: publications[0])
}
