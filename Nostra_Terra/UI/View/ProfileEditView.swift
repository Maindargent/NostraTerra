//
//  MapView.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 23/07/2026.
//
import SwiftUI

struct ProfileEditView: View {
    @State private var noSound = false
    @State private var messageNoSound = false
    @State private var texte = ""
    
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
                    Divider()
                        .frame(height: 4)
                        .overlay(.whiteIvoryMist)
                    HStack{
                        
                        Image("breton")
                            .frame(width:100, height:100)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(.whiteIvoryMist, lineWidth: 3)
                            )
                            .cornerRadius(400)
                            .padding(.leading)
                            .padding(.vertical)
                        
                        TextField("Martin Dupont", text: $texte)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(20)
                        
                        TextField("34", text: $texte)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    .padding()
                }
                    TextField("Waffles attack like a vicious monster but use lap as chair stare at ceiling tweeting a baseball. Pee on walls it smells like breakfast fooled again thinking the dog likes me for kitty power so find empty spot in cupboard and sleep all day so cat gets stuck in tree firefighters try to get cat down firefighters get stuck in tree cat eats", text: $texte, axis: .vertical)
                        .lineLimit(8...10)
                        .frame(minHeight: 200)
                    //            TextEditor(text: "Waffles attack like a vicious monster but use lap as chair stare at ceiling tweeting a baseball. Pee on walls it smells like breakfast fooled again thinking the dog likes me for kitty power so find empty spot in cupboard and sleep all day so cat gets stuck in tree firefighters try to get cat down firefighters get stuck in tree cat eats", selection: $texte)
                        .padding(5)
                        .background(.white)
                        .cornerRadius(20)
                        .padding()
                }
            
//            .background {
//                Image(.backgroundPicture)
//                    .resizable()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .ignoresSafeArea()
//            }
        }
    }
}
    
#Preview {
    ProfileEditView()
}
