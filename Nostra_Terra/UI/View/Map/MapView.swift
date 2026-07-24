//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map() {
            ForEach(publications) { publi in
                Annotation(publi.title, coordinate: publi.geoPoint) {
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: URL(string: publi.image)) { image in
                            image.resizable()
                        } placeholder: {
                            Image("placeholder").resizable()
                        }
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .background(
                            Circle().stroke(.whiteIvoryMist, lineWidth: 4)
                        )
                        .background {
                            Image(systemName: "arrowtriangle.down.fill")
                                .foregroundStyle(.whiteIvoryMist)
                                .font(.system(size: 10))
                                .shadow(radius: 10)
                                .offset(x: 0, y: 25)
                        }
                    }
                        
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
    MapView()
}
