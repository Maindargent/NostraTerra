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
    
    var wikipediaURL: URL? {
           switch self {
           case .toutes:
               return nil
           case .auvergneRhoneAlpes:
               return URL(string: "https://fr.wikipedia.org/wiki/Auvergne-Rhône-Alpes")
           case .bourgogneFrancheComte:
               return URL(string: "https://fr.wikipedia.org/wiki/Bourgogne-Franche-Comté")
           case .bretagne:
               return URL(string: "https://fr.wikipedia.org/wiki/Bretagne")
           case .centreValDeLoire:
               return URL(string: "https://fr.wikipedia.org/wiki/Centre-Val_de_Loire")
           case .corse:
               return URL(string: "https://fr.wikipedia.org/wiki/Corse")
           case .grandEst:
               return URL(string: "https://fr.wikipedia.org/wiki/Grand_Est")
           case .hautsDeFrance:
               return URL(string: "https://fr.wikipedia.org/wiki/Hauts-de-France")
           case .ileDeFrance:
               return URL(string: "https://fr.wikipedia.org/wiki/Île-de-France")
           case .normandie:
               return URL(string: "https://fr.wikipedia.org/wiki/Normandie")
           case .nouvelleAquitaine:
               return URL(string: "https://fr.wikipedia.org/wiki/Nouvelle-Aquitaine")
           case .occitanie:
               return URL(string: "https://fr.wikipedia.org/wiki/Occitanie")
           case .paysDeLaLoire:
               return URL(string: "https://fr.wikipedia.org/wiki/Pays_de_la_Loire")
           case .provenceAlpesCoteDAzur:
               return URL(string: "https://fr.wikipedia.org/wiki/Provence-Alpes-Côte_d%27Azur")
           case .mayotte:
               return URL(string: "https://fr.wikipedia.org/wiki/Mayotte")
           case .laReunion:
               return URL(string: "https://fr.wikipedia.org/wiki/La_Réunion")
           case .guyane:
               return URL(string: "https://fr.wikipedia.org/wiki/Guyane")
           case .martinique:
               return URL(string: "https://fr.wikipedia.org/wiki/Martinique")
           case .gouadeloupe:
               return URL(string: "https://fr.wikipedia.org/wiki/Guadeloupe")
           }
       }

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
