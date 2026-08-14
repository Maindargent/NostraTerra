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
    
    func getPublications(maxLength: Int? = nil, user: User? = nil) -> [(any Publication)] {
        if let maxLength {
            return Array(publications.prefix(maxLength))
        }
        if let user {
            return Array(publications).filter {
                $0.author.id == user.id
            }
            .sorted(by: {$0.created_at > $1.created_at})
        }
        return publications
    }
    
    func getShuffledPublications(maxLength: Int? = nil) -> [(any Publication)] {
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
    
    func getRegionPublications(selectedRegion: FrenchRegion) -> [(any Publication)] {
        return publications.filter{$0.region == selectedRegion}
    }
    
    func getFilteredPublications(region: FrenchRegion?, category: PublicationCategory?) -> [(any Publication)] {
        if let region, let category {
            return publications.filter({$0.region == region && $0.categories.contains(category)})
        }
        
        if let region {
            return publications.filter({$0.region == region})
        }
        
        if let category {
            return publications.filter({$0.categories.contains(category)})
        }
        
        return publications
    }
    
    func getUsedRegions() -> [(region: FrenchRegion, count: Int)] {
        var regions: [(region: FrenchRegion, count: Int)] = []
        
        for publication in getPublications() {
            if let index = regions.firstIndex(where: {$0.region == publication.region}) {
                regions[index].count += 1
            } else {
                regions.append((
                    region: publication.region,
                    count: 1
                ))
            }
        }
        
        return regions.sorted(by: {$0.region.titre > $1.region.titre})
    }
    
    func removePublication(_ publi: (any Publication)) -> Bool {
        if let index = publications.firstIndex(where: {$0.id == publi.id}) {
            publications.remove(at: index)
            return true
        } else {
            return false
        }
    }
}

