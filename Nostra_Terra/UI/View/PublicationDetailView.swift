//
//  PublicationDetailView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI

struct PublicationDetailView: View {
    let publication: Publication
    let colorType: PublicationType = .artVisuel
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .leading){
                AsyncImage(url: URL(string: publication.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxHeight: 275)
                        .clipped()
                        .cornerRadius(20)
                        .padding(.horizontal, 5)
                } placeholder: {
                    ProgressView()
                }
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.black, .clear],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .padding(.horizontal, 5)
                    .cornerRadius(20)
                Text(publication.title)
                    .foregroundStyle(.whiteIvoryMist)
                    .bold()
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.top, 200)
            }
            
            ScrollView(.horizontal) {
                HStack{
                    Text(publication.region)
                        .foregroundStyle(.whiteIvoryMist)
                        .padding(5)
                        .glassEffect(.clear.tint(publication.activity.color))
                    Text(publication.activity.rawValue)
                        .foregroundStyle(.whiteIvoryMist)
                        .padding(5)
//                        .background(colorType.color)
//                        .clipShape(Capsule())
                        .glassEffect(.clear.tint(publication.activity.color))
//                        .overlay(
//                                RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.whiteIvoryMist, lineWidth: 2)
//                        )
                }
            }
            Text(publication.description)
                .foregroundStyle(.whiteIvoryMist)
                .padding()
            Rectangle()
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding(.horizontal)
                .frame(height: 200)
        }
        .background {
            Image(.backgroundPicture)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    PublicationDetailView(publication: publications[0])
}
