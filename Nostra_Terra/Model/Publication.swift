//
//  Publication.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import Foundation
import MapKit

struct Publication: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let description: AttributedString
    let created_at: Date
    let activity: PublicationType
    let region: String
    let author: User
    let geoPoint: CLLocationCoordinate2D
    let likeCount: Int
    
    static func == (lhs: Publication, rhs: Publication) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


