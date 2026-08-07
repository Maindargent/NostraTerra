//
//  SearchView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(PublicationViewModel.self) var publicationsManager
    @State var searchResults: [any Publication] = []
    @State var searchQuery: String = ""
    
    var isSearching: Bool {
        return !searchQuery.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            List{
                if isSearching {
                    ForEach(searchResults, id: \.id) { result in
                        Text(result.title)
                    }
                } else {
//                    ForEach(publicationsManager.getPublications(), id: \.id) { publication in
//                        Text(publication.title)
//                    }
                }
            }
            .searchable(
                text: $searchQuery,
                placement: .automatic,
                prompt: "Recherche..."
            )
            .textInputAutocapitalization(.never)
            .onChange(of: searchQuery) {
                self.fetchSearchResults()
            }
            .onSubmit(of: .search) {
                fetchSearchResults()//for: searchQuery)
            }
            .overlay {
                if isSearching && searchResults.isEmpty {
                    ContentUnavailableView(
                        "Aucun résultat pour \(searchQuery)",
                        systemImage: "magnifyingglass",
                        description: Text("Vérifiez l'orthographe ou lancez une nouvelle recherche.")
                    )
                }
            }
        }
    }
    private func fetchSearchResults(){//for query: String) {
        searchResults = publicationsManager.getPublications().filter { publication in
            publication.title
                .lowercased()
                .contains(searchQuery)
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    SearchView()
        .environment(publicationManager)
}
