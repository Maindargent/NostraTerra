//
//  ToggleButtonView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 31/07/2026.
//

import SwiftUI

struct ToggleButtonView: View {
    let title: String
    @Binding var isOn: Bool
       
       var body: some View {
           HStack {
               
               Toggle(title, isOn: $isOn)
                   .foregroundStyle(.whiteIvoryMist)
                   .tint(.blueDeepSpace)
           }
           .padding(.horizontal)
       }
   }

#Preview {
    @Previewable @State var isOn: Bool = false
    ToggleButtonView(title: "privé", isOn: $isOn)
}
