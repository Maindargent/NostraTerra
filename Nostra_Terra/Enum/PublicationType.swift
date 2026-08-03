//
//  ActivityType.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import SwiftUI

enum PublicationType: String, CaseIterable, Identifiable {
    var id: Self { self }

    case tous = "Tous"
    case gastronomie = "Gastronomie"
    case musique = "Musique"
    case festival = "Festival"
    case artVivant = "Art Vivant"
    case artVisuel = "Art Visuel"
    case reconstitution = "Reconstitution"
    
    var color: Color {
        switch self {
            case .tous: return Color.white
            case .gastronomie: return Color.yellow
            case .musique: return Color.red
            case .festival: return Color.orange
            case .artVivant: return Color.blue
            case .artVisuel: return Color.green
            case .reconstitution: return Color.pink
        }
    }
}
