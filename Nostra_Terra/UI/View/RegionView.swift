//
//  RegionView.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 11/08/2026.
//

import SwiftUI
import WebKit

struct RegionView: View {
    let selectedRegion: FrenchRegion
    
    var body: some View {
        RegionWikiView(url: URL(string: "\(selectedRegion.wikipediaURL, default: "https://fr.wikipedia.org/wiki/Wikipédia:Accueil_principal")")!)
            .frame(maxWidth: .infinity, maxHeight: .infinity    )
    }
}

struct RegionWikiView: UIViewRepresentable {
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
    RegionView(selectedRegion: .bretagne)
}
