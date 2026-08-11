//
//  RegionView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 11/08/2026.
//

import SwiftUI
import WebKit

struct RegionView: View {
    var body: some View {
        MyView(url: URL(string: "\(FrenchRegion.bretagne.wikipediaURL, default: "https://fr.wikipedia.org/wiki/Wikipédia:Accueil_principal")")!)
            .frame(maxWidth: .infinity, maxHeight: .infinity    )
    }
}

struct MyView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        webView.load(URLRequest(url:url))
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

#Preview {
    RegionView()
}
