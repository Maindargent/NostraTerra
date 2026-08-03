//
//  Publication.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import Foundation
import MapKit

protocol Publication: Identifiable, Hashable {
    var id : UUID { get }
    var image: String {get set}
    var title: String {get set}
    var description: AttributedString {get set}
    var created_at: Date {get set}
    var activity: PublicationType{get set}
    var region: String {get set}
    var author: User {get set}
    var geoPoint: CLLocationCoordinate2D {get set}
    var likeCount: Int {get set}
    
//    static func == (lhs: Publication, rhs: Publication) -> Bool {
//        lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
}
struct Event: Publication{
    let id = UUID()
    let startedAt: Date
    let endAt: Date
    var image: String
    var title: String
    var description: AttributedString
    var created_at: Date
    var activity: PublicationType
    var region: String
    var author: User
    var geoPoint: CLLocationCoordinate2D
    var likeCount: Int
    
    init(startedAt: Date, endAt: Date, image: String, title: String, description: AttributedString, created_at: Date, activity: PublicationType, region: String, author: User, geoPoint: CLLocationCoordinate2D, likeCount: Int) {
        self.startedAt = startedAt
        self.endAt = endAt
        self.image = image
        self.title = title
        self.description = description
        self.created_at = created_at
        self.activity = activity
        self.region = region
        self.author = author
        self.geoPoint = geoPoint
        self.likeCount = likeCount
    }

//    init(startedAt: Date, endAt: Date) {
//        self.startedAt = startedAt
//        self.endAt = endAt
    }


struct Tradition{
    let id = UUID()
    var image: String
    var title: String
    var description: AttributedString
    var created_at: Date
    var activity: PublicationType
    var region: String
    var author: User
    var geoPoint: CLLocationCoordinate2D
    var likeCount: Int
    
    init(image: String, title: String, description: AttributedString, created_at: Date, activity: PublicationType, region: String, author: User, geoPoint: CLLocationCoordinate2D, likeCount: Int) {
        self.image = image
        self.title = title
        self.description = description
        self.created_at = created_at
        self.activity = activity
        self.region = region
        self.author = author
        self.geoPoint = geoPoint
        self.likeCount = likeCount
        
//        let d: Date
//        d = .now
//        d.formattedDate()
    }
}

extension Event: Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
}

extension Event: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Tradition: Equatable {
    static func == (lhs: Tradition, rhs: Tradition) -> Bool {
        lhs.id == rhs.id
    }
}

extension Tradition: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Date {
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "fr_FR")

        if let date = formatter.date(from: "2025-12-25") {
            let french = DateFormatter()
            french.dateStyle = .short

            return french.string(from: date)
        }
        return " "
    }
}
