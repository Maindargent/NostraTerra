//
//  Publication.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import Foundation
import MapKit



protocol Publication: Identifiable {
    var id: UUID { get set }
    var image: URL { get set }
    var uploadedImages: [ImageResource] { get set }
    var title: String { get set }
    var description: String { get set }
    var created_at: Date { get set }
    var categories: [PublicationCategory] { get set }
    var region: FrenchRegion { get set }
    var author: User { get set }
    var geoPoint: CLLocationCoordinate2D { get set }
    var likeCount: Int { get set }
}

struct Tradition: Publication, Identifiable {
    var id = UUID()
    var image: URL
    var uploadedImages: [ImageResource]
    var title: String
    var description: String
    var created_at: Date
    var categories: [PublicationCategory]
    var region: FrenchRegion
    var author: User
    var geoPoint: CLLocationCoordinate2D
    var likeCount: Int
    
    static func == (lhs: Tradition, rhs: Tradition) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Event: Publication, Identifiable {
    var id = UUID()
    var image: URL
    var uploadedImages: [ImageResource]
    var title: String
    var description: String
    var created_at: Date
    var categories: [PublicationCategory]
    var region: FrenchRegion
    var author: User
    var geoPoint: CLLocationCoordinate2D
    var likeCount: Int
    
    var startDate: Date
    var endDate: Date
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


