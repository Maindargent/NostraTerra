//
//  UserViewModel.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 11/08/2026.
//
import SwiftUI

@Observable
final class UserViewModel {
    var currentUser: User

    init(currentUser: User) {
        self.currentUser = currentUser
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
