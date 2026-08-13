//
//  PublicationRegionItem.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI
import MapKit

struct PublicationRegionItem: View {
    
    let region: FrenchRegion
    @Binding var path: [SuggestionScreen]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(initialPosition: .region(MKCoordinateRegion(center: region.coordonneeGPS, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))))
            .disabled(true)
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(.rect(cornerRadius: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.grayLines, lineWidth: 1)
            )
            .padding(.bottom, 5)
            
            VStack(alignment: .leading){
                Text(region.titre)
                    .bold()
                    .font(.system(size: 16))
                    .foregroundStyle(.whiteIvoryMist)
                    .lineLimit(1)
                    .shadow(
                        color: .black,
                        radius: 2,
                        x: 1,
                        y: 1
                    )
                
            }
            .padding(.horizontal, 9)
            .padding(.vertical, 3)
            .frame(width: 150, height: 150, alignment: .topLeading)
            
            Button{
                path.append(.discoverRegion(region))
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
    @Previewable @State var publicationManager = PublicationViewModel()
    
    PublicationRegionItem(region: .guadeloupe, path: .constant([]))
}
