//
//  Publication.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import Foundation
import MapKit

struct Publication: Identifiable {
    let id = UUID()
    let image: URL
    let title: String
    let description: AttributedString
    let created_at: Date
    let activity: PublicationType
    let region: String
    let author: User
    let geoPoint: CLLocationCoordinate2D
    let likeCount: Int
}


