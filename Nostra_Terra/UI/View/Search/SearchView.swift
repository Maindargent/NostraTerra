//
//  SearchView.swift
//  Nostra_Terra
//
//  Created by ShoSho on 23/07/2026.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(PublicationViewModel.self) var publicationsManager
    @State var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("backgroundPicture")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading, spacing: 0){
                    
                    if searchViewModel.isSearching && !searchViewModel.searchSuggestions.isEmpty{
                        Text("Suggestions :\n")
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    
                    ForEach(searchViewModel.searchSuggestions, id: \.id) { suggestion in
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
                    
                    if searchViewModel.isSearching && !searchViewModel.searchResults.isEmpty{
                        Text("Résultats de recherches :\n")
                            .foregroundStyle(.whiteIvoryMist)
                    }
                    
                    ForEach(searchViewModel.searchResults, id: \.id) { result in
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
                text: $searchViewModel.searchQuery,
                placement: .automatic,
                prompt: "Recherche..."
            )
            .textInputAutocapitalization(.never)
            .onChange(of: searchViewModel.searchQuery) {
                self.searchViewModel.fetchSearchResults(publicationsManager.getPublications())
                self.searchViewModel.fetchSearchSuggestions(publicationsManager.getPublications())
            }
            .overlay {
                if searchViewModel.isSearching && searchViewModel.searchResults.isEmpty {
                    ContentUnavailableView(
                        "Aucun résultat pour \(searchViewModel.searchQuery)",
                        systemImage: "magnifyingglass",
                        description: Text("Vérifiez l'orthographe ou lancez une nouvelle recherche.")
                    )
                    .foregroundStyle(.whiteIvoryMist)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var publicationManager = PublicationViewModel()
    SearchView()
        .environment(publicationManager)
}
