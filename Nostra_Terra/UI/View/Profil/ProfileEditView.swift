//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import PhotosUI

struct ProfileEditView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(UserViewModel.self) var userVM
    
    @State private var noSound = false
    @State private var messageNoSound = false
    @State var profilEditVM = ProfilEditViewModel()
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    let user: User
    
    var body: some View {
        ZStack {
            Image(.backgroundPicture)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            ScrollView {
            
                Text("Mes informations")
                    .foregroundStyle(.whiteIvoryMist)
                    .bold()
                    .font(.title2)
                    .padding(.horizontal)
                
                HStack {
                    VStack {
                        if let avatarImage {
                            avatarImage
                                .resizable()
                                .scaledToFill()
                                .frame(width:100, height:100)
                                .clipShape(Circle())
                                .cornerRadius(20)
                                .padding(.horizontal, 5)
                                .overlay(
                                    Circle()
                                        .stroke(.whiteIvoryMist, lineWidth: 3)
                                )
                        } else {
                            AsyncImage(url: user.profilPicture) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:100, height:100)
                                    .clipShape(Circle())
                                    .cornerRadius(20)
                                    .padding(.horizontal, 5)
                                    .overlay(
                                        Circle()
                                            .stroke(.whiteIvoryMist, lineWidth: 3)
                                    )
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                        PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
                    }
                    
                    VStack{
                        
                        VStack(alignment: .leading) {
                            Text("Prénom :")
                            TextField(profilEditVM.firstName, text: $profilEditVM.firstName)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 3)
                            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.whiteIvoryMist)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Nom :")
                            TextField(profilEditVM.lastName, text: $profilEditVM.lastName)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 3)
                            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.whiteIvoryMist)
                        }
                        
                        
                    }
                    .onChange(of: avatarItem) {
                        Task {
                            if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                                avatarImage = loaded
                                profilEditVM.uploadedImage = avatarItem
                            } else {
                                print("Failed")
                            }
                        }
                    }
                }
                .padding(8)
                .padding(.horizontal, 8)
                
                
                VStack(alignment: .leading, spacing: 12) {
                    DatePicker(
                        "Date de Naissance",
                        selection: $profilEditVM.birthDate,
                        displayedComponents: [.date]
                    )
                        .datePickerStyle(.compact)
                        .preferredColorScheme(.dark)
                    
                    TextField(text: $profilEditVM.description, axis: .vertical) {
                        Text(user.description)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .lineLimit(8...10)
                    .frame(minHeight: 200)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 3)
                    .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                    .foregroundStyle(.whiteIvoryMist)
                    
                    Button() {
                        if let user = profilEditVM.getUser {
                            userVM.currentUser = user
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Valider")
                        }
                    }
                    .padding(8)
                    .buttonStyle(.glassProminent)
                    .tint(.yellowTuscanSun.opacity(0.7))
                    .foregroundStyle(.whiteIvoryMist)
                    .disabled(!profilEditVM.isFormValid)
                }
                .padding()
                
                VStack{
                    Text("Notifications")
                        .foregroundStyle(.whiteIvoryMist)
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    ToggleButtonView(title: "Mettre en sourdine", isOn: $noSound)
                    ToggleButtonView(title: "Message uniquement", isOn: $messageNoSound)
                }
            }
        }
        .onAppear {
            profilEditVM.setData(user: userVM.currentUser)
        }
    }
}

#Preview {
    RootView()
}
