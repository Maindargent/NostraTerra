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
    @State var searchSuggestions: [any Publication] = []
    @State var searchQuery: String = ""
    
    var isSearching: Bool {
        return !searchQuery.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("backgroundPicture")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading, spacing: 0){
                    
                    if isSearching {
                        Text("Suggestions :\n")
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    
                    ForEach(searchSuggestions, id: \.id) { suggestion in
                        NavigationLink{
                            PublicationDetailView(publication: suggestion)
                        }label: {
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Text(suggestion.title)
                            }
                            .foregroundStyle(.grayLines)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 3)
                        }
                        Divider()
                            .frame(width: 3)
                            .overlay(.grayLines)
                            .padding(.bottom, 20)
                    }
                    
                    if isSearching && !searchResults.isEmpty{
                        Text("Résultats de recherches :\n")
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    
                    ForEach(searchResults, id: \.id) { result in
                        NavigationLink{
                            PublicationDetailView(publication: result)
                        }label: {
                            SearchItem(publication: result)
                        }
                    }
                    .padding(.bottom, 20)
                }
                .padding()
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .searchable(
                text: $searchQuery,
                placement: .automatic,
                prompt: "Recherche..."
            )
            .textInputAutocapitalization(.never)
            .onChange(of: searchQuery) {
                self.fetchSearchResults()
                self.fetchSearchSuggestions()
            }
            .overlay {
                if isSearching && searchResults.isEmpty {
                    ContentUnavailableView(
                        "Aucun résultat pour \(searchQuery)",
                        systemImage: "magnifyingglass",
                        description: Text("Vérifiez l'orthographe ou lancez une nouvelle recherche.")
                    )
                    .foregroundStyle(.whiteIvoryMist)
                }
            }
        }
    }
    private func fetchSearchResults(){
        if searchQuery.isEmpty{
            searchResults = []
        }else{
            searchResults = Array(
                publicationsManager.getPublications().filter { publication in
                    publication.title
                        .lowercased()
                        .hasPrefix(searchQuery)
                }
                    .prefix(3)
            )
        }
    }
    
    private func fetchSearchSuggestions(){
        if searchQuery.isEmpty{
            searchSuggestions = []
        }else{
            searchSuggestions = Array(
                publicationsManager.getPublications()
                    .filter {
                        $0.title.localizedCaseInsensitiveContains(searchQuery)
                    }
                    .prefix(3)
            )
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    SearchView()
        .environment(publicationManager)
}
