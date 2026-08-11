//
//  PublicationViewModel.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 05/08/2026.
//

import SwiftUI

@Observable
final class PublicationViewModel {
    
    var publications = MOCKED_PUBLICATIONS

    var suggestionPublicationsShuffled = MOCKED_PUBLICATIONS.shuffled().prefix(5).enumerated()
    
    func getPublications(maxLength: Int? = nil) -> [(any Publication)] {
        if let maxLength {
            return Array(publications.prefix(maxLength))
        }
        return publications
    }
    
    func getShuffledPublications(maxLength: Int? = nil) -> [(any Publication)]{
        if let maxLength {
            return Array(publications.prefix(maxLength)).shuffled()
        }
        return publications.shuffled()
    }
    
    func getRandomPublication() -> (any Publication) {
        return publications.randomElement()!
    }
    
    func getPublication(id: UUID) -> (any Publication)? {
        return publications.first{$0.id == id}
    }
    
    func addPublication(_ publication: (any Publication)) {
        publications.append(publication)
    }
    
    func refreshSuggestionPublicationsShuffled() {
        suggestionPublicationsShuffled = MOCKED_PUBLICATIONS.shuffled().prefix(5).enumerated()
    }
}
