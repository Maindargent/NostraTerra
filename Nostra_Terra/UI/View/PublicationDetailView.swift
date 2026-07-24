//
//  PublicationDetailView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 23/07/2026.
//

import SwiftUI

struct PublicationDetailView: View {
    var publication: Publication
    @Binding var selectedPublication: Publication?
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: publication.image)) { image in
                image.resizable()
            } placeholder: {
                Image("placeholder").resizable()
            }
            .scaledToFill()
            .ignoresSafeArea()
            
            Button {
                selectedPublication = nil
            } label: {
                Text(publication.title)
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .semibold))
                    .padding(12)
            }
            .tint(.clear)
            .buttonStyle(.glass)
        }
        .presentationDragIndicator(.visible)
        .presentationDetents([.fraction(0.8)])
    }
}

#Preview {
    PublicationDetailView(publication: publications[0], selectedPublication: .constant(publications[0]))
}
