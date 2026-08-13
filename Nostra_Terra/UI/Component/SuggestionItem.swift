//
//  SuggestionItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SuggestionItem: View {
    
    let publication: (any Publication)
    @Binding var path: [SuggestionScreen]
    
    var body: some View {
        
        VStack(alignment: .center) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: publication.image) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "photo")
                        .foregroundStyle(.blueDeepSpace)
                }
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
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
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                HStack {
                    VStack(alignment: .leading){
                        Text(publication.title)
                            .bold()
                            .font(.system(size: 16))
                            .foregroundStyle(.whiteIvoryMist)
                        
                        HStack{
                            Text(publication.created_at, format: .dateTime.day().month(.defaultDigits).year())
                                .foregroundStyle(.whiteIvoryMist)
                            
                            Text(publication.region.titre)
                                .foregroundStyle(.whiteIvoryMist)
                        }
                        .font(.system(size: 12))
                        
                    }
                    
                    Spacer()
                    
                    Button{
                        path.append(.publicationDetail(publication.id))
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
            
            
            VStack(alignment: .leading) {
                Text(publication.description)
                    .multilineTextAlignment(.leading)
                    .padding(.all, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 125)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.thickMaterial)
                .shadow(radius: 20)
        )
        
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    SuggestionItem(publication: publicationManager.getRandomPublication(), path: .constant([]))
}
