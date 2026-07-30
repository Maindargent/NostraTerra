//
//  PublicationData.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//

import Foundation
import MapKit

let publications: [any Publication] = [
    Tradition(
        image: URL(string: "https://picsum.photos/seed/fetes-saint-jean/800/600")!,
        uploadedImages: [],
        title: "Les feux de la Saint-Jean",
        description: "À l’arrivée de l’été, les villages se rassemblent autour de grands feux de joie. Entre musique traditionnelle, danses collectives et repas partagés, cette célébration transmet un rituel ancien où l’on vient saluer la lumière, retrouver ses voisins et faire vivre les coutumes locales.",
        created_at: Date(),
        categories: [.festival, .musique, .artVivant],
        region: .occitanie,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 43.1730, longitude: 2.7450),
        likeCount: 267
    ),
    Event(
        image: URL(string: "https://picsum.photos/seed/braderie-lille/800/600")!,
        uploadedImages: [],
        title: "La Braderie de Lille",
        description: "Chaque premier week-end de septembre, les rues de Lille deviennent un immense marché à ciel ouvert. Habitants, associations et visiteurs y chinent des objets, découvrent les spécialités locales et profitent d’animations musicales qui donnent à cette fête populaire une atmosphère unique, conviviale et profondément nordiste.",
        created_at: Date(),
        categories: [.festival, .gastronomie, .musique],
        region: .hautsDeFrance,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573),
        likeCount: 638,
        startDate: Date(),
        endDate: Date()
    ),
    Tradition(
        image: URL(string: "https://picsum.photos/seed/transhumance/800/600")!,
        uploadedImages: [],
        title: "La transhumance",
        description: "La montée traditionnelle des troupeaux vers les alpages.",
        created_at: Date(),
        categories: [.artVivant],
        region: .auvergneRhoneAlpes,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 45.1056, longitude: 5.8778),
        likeCount: 128
    ),
    Tradition(
        image: URL(string: "https://picsum.photos/seed/aubusson/800/600")!,
        uploadedImages: [],
        title: "La tapisserie d’Aubusson",
        description: "Un savoir-faire de tissage transmis dans la Creuse.",
        created_at: Date(),
        categories: [.artVisuel],
        region: .nouvelleAquitaine,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 45.9563, longitude: 2.1671),
        likeCount: 214
    ),
    Tradition(
        image: URL(string: "https://picsum.photos/seed/limoges/800/600")!,
        uploadedImages: [],
        title: "La porcelaine de Limoges",
        description: "L’artisanat traditionnel de la porcelaine fine.",
        created_at: Date(),
        categories: [.artVisuel],
        region: .nouvelleAquitaine,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 45.8336, longitude: 1.2611),
        likeCount: 176
    ),
    Tradition(
        image: URL(string: "https://picsum.photos/seed/alencon/800/600")!,
        uploadedImages: [],
        title: "Le point d’Alençon",
        description: "Une dentelle à l’aiguille d’exception.",
        created_at: Date(),
        categories: [.artVisuel],
        region: .normandie,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 48.4321, longitude: 0.0931),
        likeCount: 153
    ),
    Tradition(
        image: URL(string: "https://picsum.photos/seed/grasse/800/600")!,
        uploadedImages: [],
        title: "Les parfums de Grasse",
        description: "La création de parfums et la culture des plantes à parfum.",
        created_at: Date(),
        categories: [.artVisuel],
        region: .provenceAlpesCoteDAzur,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 43.6583, longitude: 6.9238),
        likeCount: 195
    ),
    Event(
        image: URL(string: "https://picsum.photos/seed/menton/800/600")!,
        uploadedImages: [],
        title: "Fête du Citron de Menton",
        description: "Sculptures d’agrumes et corsos fleuris à Menton.",
        created_at: Date(),
        categories: [.festival],
        region: .provenceAlpesCoteDAzur,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 43.7745, longitude: 7.4975),
        likeCount: 342,
        startDate: Date(),
        endDate: Date()
    ),
    Event(
        image: URL(string: "https://picsum.photos/seed/nice/800/600")!,
        uploadedImages: [],
        title: "Carnaval de Nice",
        description: "Défilés de chars et batailles de fleurs.",
        created_at: Date(),
        categories: [.festival, .artVivant],
        region: .provenceAlpesCoteDAzur,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 43.6954, longitude: 7.2650),
        likeCount: 401,
        startDate: Date(),
        endDate: Date()
    ),
    Event(
        image: URL(string: "https://picsum.photos/seed/bayonne/800/600")!,
        uploadedImages: [],
        title: "Fêtes de Bayonne",
        description: "Musique, défilés et traditions basques.",
        created_at: Date(),
        categories: [.festival, .musique],
        region: .nouvelleAquitaine,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 43.4929, longitude: -1.4748),
        likeCount: 489,
        startDate: Date(),
        endDate: Date()
    ),
    Event(
        image: URL(string: "https://picsum.photos/seed/lorient/800/600")!,
        uploadedImages: [],
        title: "Festival Interceltique de Lorient",
        description: "Musique et danses des cultures celtes.",
        created_at: Date(),
        categories: [.musique, .festival],
        region: .bretagne,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 47.7456, longitude: -3.3668),
        likeCount: 376,
        startDate: Date(),
        endDate: Date()
    ),
    Event(
        image: URL(string: "https://picsum.photos/seed/charrues/800/600")!,
        uploadedImages: [],
        title: "Festival des Vieilles Charrues",
        description: "Un grand festival de musique à Carhaix.",
        created_at: Date(),
        categories: [.musique, .festival],
        region: .bretagne,
        author: users.randomElement()!,
        geoPoint: CLLocationCoordinate2D(latitude: 48.2756, longitude: -3.5732),
        likeCount: 521,
        startDate: Date(),
        endDate: Date()
    )
]
