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
                    ForEach(searchSuggestions, id: \.id) { suggestion in
                        Button{
                            
                        }label: {
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Text(suggestion.title)
                            }
                            .padding(.horizontal, 9)
                            .padding(.vertical, 3)
                        }
                        Divider()
                            .frame(width: 3)
                            .overlay(.grayLines)
                    }
                    
                    ForEach(searchResults, id: \.id) { result in
                        SearchItem(publication: result)
                        //                        Text(result.title)
                    }
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
        searchResults = Array(
            publicationsManager.getPublications().filter { publication in
                publication.title
                    .lowercased()
                    .contains(searchQuery)
            }
                .prefix(3)
        )
    }
    
    private func fetchSearchSuggestions(){
        searchSuggestions = Array(
            publicationsManager.getPublications()
                .filter {
                    $0.title.localizedCaseInsensitiveContains(searchQuery)
                }
                .prefix(3)
        )
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    SearchView()
        .environment(publicationManager)
}
