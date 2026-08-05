//
//  RegionType.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 31/07/2026.
//

import Foundation
import SwiftUI

enum RegionType: String, CaseIterable, Identifiable {
    var id: Self { self }

    case toutes = "Toutes"
    case auvergneRhoneAlpes = "Auvergne-Rhône-Alpes"
    case bourgogneFrancheComte = "Bourgogne-Franche-Comté"
    case bretagne = "Bretagne"
    case centreValDeLoire = "Centre-Val de Loire"
    case corse = "Corse"
    case grandEst = "Grand Est"
    case hautsDeFrance = "Hauts-de-France"
    case ileDeFrance = "Île-de-France"
    case normandie = "Normandie"
    case nouvelleAquitaine = "Nouvelle-Aquitaine"
    case occitanie = "Occitanie"
    case paysDeLaLoire = "Pays de la Loire"
    case provenceAlpesCoteDAzur = "Provence-Alpes-Côte d'Azur"
    case mayotte = "Mayotte"
    case laReunion = "La Réunion"
    case guyane = "Guyane"
    case martinique = "Martinique"
    case gouadeloupe = "Gouadeloupe"

    var color: Color {
        switch self {
        case .toutes:
            return .white
        case .auvergneRhoneAlpes:
            return .red
        case .bourgogneFrancheComte:
            return .orange
        case .bretagne:
            return .green
        case .centreValDeLoire:
            return .mint
        case .corse:
            return .yellow
        case .grandEst:
            return .purple
        case .hautsDeFrance:
            return .blue
        case .ileDeFrance:
            return .cyan
        case .normandie:
            return .teal
        case .nouvelleAquitaine:
            return .brown
        case .occitanie:
            return .pink
        case .paysDeLaLoire:
            return .indigo
        case .provenceAlpesCoteDAzur:
            return .gray
        case .mayotte:
            return .greenIndian
        case .martinique:
            return .blueDeepSpace
        case .laReunion:
            return .whiteIvoryMist
        case .guyane:
            return .yellowTuscanSun
        case .gouadeloupe:
            return .red
        }
    }
}
