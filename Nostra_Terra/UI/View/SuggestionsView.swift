//
//  SuggestionsView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SuggestionsView: View {
    
    let user: User
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: user.profilPicture) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "person.slash.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.blueDeepSpace)
                }
                .frame(width: 51, height: 51)
                .clipShape(Circle())
                .shadow(color: .whiteIvoryMist, radius: 3)
                .padding(.trailing)
                .padding(.bottom, 20)
                
                Text("Bonjour \(user.firstName) !")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.whiteIvoryMist)
            }
            
            Text("Suggestions")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.whiteIvoryMist)
            
        }
        .background(
            Image("backgroundPicture")
        )
    }
}

#Preview {
    SuggestionsView(user: users[0])
}
