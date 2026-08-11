//
//  SearchViewModel.swift
//  Nostra_Terra
//
//  Created by ShoSho on 10/08/2026.
//

import SwiftUI

@Observable
final class SearchViewModel{
    
    var searchResults: [any Publication] = []
    var searchSuggestions: [any Publication] = []
    var searchQuery: String = ""
    
    var isSearching: Bool {
        return !searchQuery.isEmpty
    }
    
    func fetchSearchResults(_ publication: [any Publication]){
        if searchQuery.isEmpty{
            searchResults = []
        }else{
            searchResults = Array(
                publication.filter { publication in
                    publication.title
                        .lowercased()
                        .hasPrefix(searchQuery)
                }
                    .prefix(3)
            )
        }
    }
    
    func fetchSearchSuggestions(_ publication: [any Publication]){
        if searchQuery.isEmpty{
            searchSuggestions = []
        }else{
            searchSuggestions = Array(
                publication
                    .filter {
                        $0.title.localizedCaseInsensitiveContains(searchQuery)
                    }
                    .prefix(3)
            )
        }
    }
    
}
