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
    var currentUser = users[0]
    
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
    
    func isLiked(_ publication: any Publication) -> Bool {
        currentUser.likedPublication.contains {
            $0.id == publication.id
        }
    }
    
    func toggleLike(_ publication: any Publication) {
        if isLiked(publication) {
            currentUser.likedPublication.removeAll {
                $0.id == publication.id
            }
        } else {
            currentUser.likedPublication.append(publication)
        }
    }
}
