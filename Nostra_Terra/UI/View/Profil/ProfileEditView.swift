//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI
import PhotosUI

struct ProfileEditView: View {
    @State private var noSound = false
    @State private var messageNoSound = false
    @State private var name = ""
    @State private var age = ""
    @State private var texte = ""
    @State private var profilPictule = ""
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    let user: User
    
    var body: some View {
        ZStack{
            Image(.backgroundPicture)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("Notifications")
                        .foregroundStyle(.whiteIvoryMist)
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    ToggleButtonView(title: "Mettre en sourdine", isOn: $noSound)
                    ToggleButtonView(title: "Message uniquement", isOn: $messageNoSound)
                }
                Text("Mes informations")
                    .foregroundStyle(.whiteIvoryMist)
                    .bold()
                    .font(.title2)
                    .padding(.horizontal)
                ZStack{
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
                            HStack{
                                TextField(text: $name) {
                                    Text("\(user.firstName) \(user.lastName)")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.horizontal, 9)
                                .padding(.vertical, 3)
                                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                                .foregroundStyle(.whiteIvoryMist)
                                
                                //faire le calcul pour afficher l'age
                                TextField(text: $age) {
                                    Text("\(user.birthDate)")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                
                                .padding(.horizontal, 9)
                                .padding(.vertical, 3)
                                .frame(width: 50)
                                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                                .foregroundStyle(.whiteIvoryMist)
                            }
                            .padding(.vertical, 8)
                            
                            
                            .onChange(of: avatarItem) {
                                Task {
                                    if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                                        avatarImage = loaded
                                    } else {
                                        print("Failed")
                                    }
                                }
                            }
                        }
                    }
                    .padding(8)
                    .padding(.horizontal, 8)
                }
                TextField(text: $texte, axis: .vertical) {
                    Text("Waffles attack like a vicious monster but use lap as chair stare at ceiling tweeting a baseball. Pee on walls it smells like breakfast fooled again thinking the dog likes me for kitty power so find empty spot in cupboard and sleep all day so cat gets stuck in tree firefighters try to get cat down firefighters get stuck in tree cat eats")
                        .foregroundStyle(.white.opacity(0.5))
                }
                .lineLimit(8...10)
                .frame(minHeight: 200)
                .padding(.horizontal, 9)
                .padding(.vertical, 3)
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                .foregroundStyle(.whiteIvoryMist)
                .padding()
                Button() {
                    
                } label: {
                    Image(systemName: "checkmark")
                    Text("Valider")
                }
                .padding(8)
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 12))
                .foregroundStyle(.whiteIvoryMist)
            }
        }
    }
}

#Preview {
    ProfileEditView(user: users[0])
}

//                    Divider()
//                        .frame(height: 4)
//                        .overlay(.whiteIvoryMist)

//            .background {
//                Image(.backgroundPicture)
//                    .resizable()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .ignoresSafeArea()
//            }
