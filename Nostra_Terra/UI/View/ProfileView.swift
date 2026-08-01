//
//  ProfileView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ZStack{
            
            Image("backgroundPicture")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
        }
    }
}

#Preview {
    ProfileView()
}
