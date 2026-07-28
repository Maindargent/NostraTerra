//
//  Publication.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import Foundation
import MapKit

enum FrenchRegion: String, CaseIterable, Identifiable {
    case auvergneRhoneAlpes
    case bourgogneFrancheComte
    case bretagne
    case centreValDeLoire
    case corse
    case grandEst
    case hautsDeFrance
    case ileDeFrance
    case normandie
    case nouvelleAquitaine
    case occitanie
    case paysDeLaLoire
    case provenceAlpesCoteDAzur
    case guadeloupe
    case guyane
    case martinique
    case mayotte
    case reunion

    var id: Self { self }

    var titre: String {
        switch self {
        case .auvergneRhoneAlpes: "Auvergne-Rhône-Alpes"
        case .bourgogneFrancheComte: "Bourgogne-Franche-Comté"
        case .bretagne: "Bretagne"
        case .centreValDeLoire: "Centre-Val de Loire"
        case .corse: "Corse"
        case .grandEst: "Grand Est"
        case .hautsDeFrance: "Hauts-de-France"
        case .ileDeFrance: "Île-de-France"
        case .normandie: "Normandie"
        case .nouvelleAquitaine: "Nouvelle-Aquitaine"
        case .occitanie: "Occitanie"
        case .paysDeLaLoire: "Pays de la Loire"
        case .provenceAlpesCoteDAzur: "Provence-Alpes-Côte d’Azur"
        case .guadeloupe: "Guadeloupe"
        case .guyane: "Guyane"
        case .martinique: "Martinique"
        case .mayotte: "Mayotte"
        case .reunion: "La Réunion"
        }
    }

    var coordonneeGPS: CLLocationCoordinate2D {
        switch self {
        case .auvergneRhoneAlpes: .init(latitude: 45.7640, longitude: 4.8357) // Lyon
        case .bourgogneFrancheComte: .init(latitude: 47.2378, longitude: 6.0241) // Besançon
        case .bretagne: .init(latitude: 48.1173, longitude: -1.6778) // Rennes
        case .centreValDeLoire: .init(latitude: 47.9030, longitude: 1.9093) // Orléans
        case .corse: .init(latitude: 41.9192, longitude: 8.7386) // Ajaccio
        case .grandEst: .init(latitude: 48.5734, longitude: 7.7521) // Strasbourg
        case .hautsDeFrance: .init(latitude: 50.6292, longitude: 3.0573) // Lille
        case .ileDeFrance: .init(latitude: 48.8566, longitude: 2.3522) // Paris
        case .normandie: .init(latitude: 49.4432, longitude: 1.0993) // Rouen
        case .nouvelleAquitaine: .init(latitude: 44.8378, longitude: -0.5792) // Bordeaux
        case .occitanie: .init(latitude: 43.6047, longitude: 1.4442) // Toulouse
        case .paysDeLaLoire: .init(latitude: 47.2184, longitude: -1.5536) // Nantes
        case .provenceAlpesCoteDAzur: .init(latitude: 43.2965, longitude: 5.3698) // Marseille
        case .guadeloupe: .init(latitude: 15.9985, longitude: -61.7250) // Basse-Terre
        case .guyane: .init(latitude: 4.9224, longitude: -52.3135) // Cayenne
        case .martinique: .init(latitude: 14.6037, longitude: -61.0742) // Fort-de-France
        case .mayotte: .init(latitude: -12.7822, longitude: 45.2279) // Mamoudzou
        case .reunion: .init(latitude: -20.8789, longitude: 55.4481) // Saint-Denis
        }
    }
}

protocol Publication: Identifiable, Hashable, Equatable {
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

struct Tradition: Publication {
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

struct Event: Publication {
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


