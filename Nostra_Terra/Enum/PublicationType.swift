//
//  ActivityType.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//
import SwiftUI

enum PublicationType: String, CaseIterable {
    case gastronomie = "Gastronomie"
    case musique = "Musique"
    case festival = "Festival"
    case artVivant = "Art Vivant"
    case artVisuel = "Art Visuel"
    case reconstitution = "Reconstitution"
    
    var color: Color {
        switch self {
            case .gastronomie: return Color.pink
            case .musique: return Color.red
            case .festival: return Color.orange
            case .artVivant: return Color.blue
            case .artVisuel: return Color.green
            case .reconstitution: return Color.brown
        }
    }
}
