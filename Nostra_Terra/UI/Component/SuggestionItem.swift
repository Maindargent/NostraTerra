//
//  SuggestionItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SuggestionItem: View {
    
    let publication: Publication
    @Binding var showDetail: Bool
    
    var body: some View {
        
        VStack(alignment: .center) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: publication.image)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "photo")
                        .foregroundStyle(.blueDeepSpace)
                }
                .scaledToFill()
                .frame(width: .infinity, height: 200)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 20,
                        topTrailingRadius: 20
                    )
                )
                .padding(.bottom, 5)
                
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.black, .clear],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(width: .infinity, height: 60)
                
                HStack {
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
                    
                    Spacer()
                    
                    Button{
                        showDetail = true
                    } label : {
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 14))
                    .padding(10)
                    .glassEffect(.regular.tint(.blueDeepSpace).interactive(), in: .circle)
                }
                .padding(.all, 20)
            }
            ///MARK: TODO : REGLER PADDING
            Text(publication.description)
                .multilineTextAlignment(.leading)
                .padding(.all, 10)
                .frame(width: .infinity, height: 125)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.thickMaterial)
                .shadow(radius: 20)
                //.frame(height: 50)
        )
        
    }
}

#Preview {
    SuggestionItem(publication: publications[0], showDetail: .constant(true))
}
