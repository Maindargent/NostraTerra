//
//  FrenchRegion.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 30/07/2026.
//
import SwiftUI
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
    
    var color: Color {
        switch self {
        case .auvergneRhoneAlpes:
            Color(red: 0.18, green: 0.48, blue: 0.78)

        case .bourgogneFrancheComte:
            Color(red: 0.55, green: 0.16, blue: 0.28)

        case .bretagne:
            Color(red: 0.20, green: 0.24, blue: 0.32)

        case .centreValDeLoire:
            Color(red: 0.22, green: 0.62, blue: 0.42)

        case .corse:
            Color(red: 0.86, green: 0.32, blue: 0.24)

        case .grandEst:
            Color(red: 0.38, green: 0.25, blue: 0.68)

        case .hautsDeFrance:
            Color(red: 0.15, green: 0.42, blue: 0.66)

        case .ileDeFrance:
            Color(red: 0.16, green: 0.29, blue: 0.58)

        case .normandie:
            Color(red: 0.34, green: 0.58, blue: 0.72)

        case .nouvelleAquitaine:
            Color(red: 0.16, green: 0.58, blue: 0.53)

        case .occitanie:
            Color(red: 0.78, green: 0.22, blue: 0.34)

        case .paysDeLaLoire:
            Color(red: 0.24, green: 0.66, blue: 0.60)

        case .provenceAlpesCoteDAzur:
            Color(red: 0.95, green: 0.52, blue: 0.18)

        case .guadeloupe:
            Color(red: 0.20, green: 0.66, blue: 0.30)

        case .guyane:
            Color(red: 0.10, green: 0.48, blue: 0.25)

        case .martinique:
            Color(red: 0.10, green: 0.58, blue: 0.78)

        case .mayotte:
            Color(red: 0.45, green: 0.28, blue: 0.72)

        case .reunion:
            Color(red: 0.92, green: 0.38, blue: 0.52)
        }
    }
}
