//
//  ProfileView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(PublicationViewModel.self) var publicationManager: PublicationViewModel
    @Environment(UserViewModel.self) var userViewModel
    
    @State var profileViewModel = ProfileViewModel()
    
    @State var item: PhotosPickerItem? = nil
    @State private var image: Image?
    @State private var isLoading = true
    
    var body: some View {
        ZStack{
            Image("backgroundPicture")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .trailing){
                    
                    NavigationLink{
                        ProfileEditView(user: userViewModel.currentUser)
                            .environment(userViewModel)
                    }label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.whiteIvoryMist)
                            .font(.title)
                            .bold()
                    }
                    .padding(.trailing, 20)
                    
                    VStack(alignment: .leading){
                        
                        Text("Profil")
                            .foregroundStyle(.whiteIvoryMist)
                            .font(.system(size: 32))
                            .bold()
                            .padding(.leading, 20)
                        
                        ZStack{
                            
                            Divider()
                                .overlay(.whiteIvoryMist)
                            
                            HStack(spacing: 20) {
                                
                                if userViewModel.currentUser.uploadedImage != nil {
                                    HStack {
                                        if let image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .clipped()
                                        } else if isLoading {
                                            ProgressView()
                                        }
                                    }
                                    .onAppear(perform: {
                                        item = userViewModel.currentUser.uploadedImage
                                    })
                                    .task(id: item) {
                                        if let item {
                                            isLoading = true
                                            image = try? await item.loadTransferable(type: Image.self)
                                            isLoading = false
                                        }
                                    }
                                } else {
                                    AsyncImage(url: userViewModel.currentUser.profilPicture) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Image(systemName: "photo")
                                    }
                                    .frame(width: 115, height: 115)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .stroke(.whiteIvoryMist, lineWidth: 2)
                                    }
                                    .foregroundStyle(.whiteIvoryMist)
                                }
                                
                                
                                Text("\(userViewModel.currentUser.lastName) \(userViewModel.currentUser.firstName)")
                                    .padding(.horizontal, 9)
                                    .padding(.vertical, 3)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.blueDeepSpace)
                                    }
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.whiteIvoryMist, lineWidth: 2)
                                    }
                                    .foregroundStyle(.whiteIvoryMist)
                                
                                Text("\(profileViewModel.age.year ?? 0) ans")
                                    .padding(.horizontal, 9)
                                    .padding(.vertical, 3)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.blueDeepSpace)
                                    }
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.whiteIvoryMist, lineWidth: 2)
                                    }
                                    .foregroundStyle(.whiteIvoryMist)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        VStack{
                            Text(userViewModel.currentUser.description)
                                .foregroundStyle(.whiteIvoryMist)
                                .multilineTextAlignment(.leading)
                                .padding(.all, 20)
                                .glassEffect(in: .rect(cornerRadius: 20))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                        
                        
                        LabelUIKitRepresentable(text: "Mes publications")
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        
                        ScrollView(.horizontal){
                            HStack(alignment: .bottom){
                                
                                let userPublications = publicationManager
                                    .getPublications()
                                    .filter {
                                        $0.author.id == userViewModel.currentUser.id
                                    }
                                    .sorted(by: {$0.created_at > $1.created_at})
                                
                                if userPublications.isEmpty {
                                    Text("Vous n'avez rien publié.")
                                        .padding(.leading, 20)
                                        .padding(.top, 20)
                                        .foregroundStyle(.whiteIvoryMist)
                                } else {
                                    ForEach(userPublications, id: \.id) { publication in
                                        NavigationLink {
                                            PublicationDetailView(publicationID: publication.id)
                                        } label: {
                                            PublicationItem(publication: publication)
                                        }
                                    }
                                    
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        LabelUIKitRepresentable(text: "Mes coups de coeurs")
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        
                        ScrollView(.horizontal){
                            HStack(alignment: .bottom){
                                
                                let likedPublications = publicationManager.getPublications().filter{ publication in
                                    userViewModel.isLiked(publication)
                                }
                                if likedPublications.isEmpty{
                                    Text("Vous n'avez aucun favoris.")
                                        .padding(.leading, 20)
                                        .padding(.top, 20)
                                        .foregroundStyle(.whiteIvoryMist)
                                }else{
                                    ForEach(likedPublications, id: \.id) { publication in
                                        NavigationLink {
                                            PublicationDetailView(publicationID: publication.id)
                                        } label: {
                                            PublicationItem(publication: publication)
                                        }
                                    }
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    @Previewable @State var userViewModel = UserViewModel(currentUser: users[0])
    
    ProfileView()
        .environment(publicationManager)
        .environment(userViewModel)
}
