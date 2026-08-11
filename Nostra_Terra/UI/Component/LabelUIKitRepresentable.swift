//
//  LabelUIKitRepresentable.swift
//  Nostra_Terra
//
//  Created by ShoSho on 11/08/2026.
//

import SwiftUI

struct LabelUIKitRepresentable: UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> some UIView {
        let label = UILabel()
        label.text = text
        label.textColor = .whiteIvoryMist
        label.font.withSize(16)
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#Preview {
    LabelUIKitRepresentable(text: "coucou").preferredColorScheme(.dark)
}
