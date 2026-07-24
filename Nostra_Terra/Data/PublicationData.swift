//
//  PublicationData.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//

import Foundation
import MapKit

let publications: [Publication] = [

    Publication(
        image:  "https://picsum.photos/seed/gastro1/800/600",
        title: "Marché gourmand",
        description: try! AttributedString(markdown: "Découverte des **saveurs locales** et des producteurs régionaux."),
        created_at: .now.addingTimeInterval(-3600 * 4),
        activity: .gastronomie,
        region: "Bretagne",
        author: users[2],
        geoPoint: CLLocationCoordinate2D(latitude: 48.3904, longitude: -4.4861),
        likeCount: 126
    ),

    Publication(
        image:  "https://picsum.photos/seed/music1/800/600",
        title: "Concert en plein air",
        description: try! AttributedString(markdown: "Une soirée mémorable sous les étoiles avec un groupe indépendant."),
        created_at: .now.addingTimeInterval(-3600 * 24),
        activity: .musique,
        region: "Île-de-France",
        author: users[1],
        geoPoint: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        likeCount: 284
    ),

    Publication(
        image: "https://picsum.photos/seed/festival1/800/600",
        title: "Festival des Lumières",
        description: try! AttributedString(markdown: "Des installations lumineuses spectaculaires dans toute la ville."),
        created_at: .now.addingTimeInterval(-3600 * 48),
        activity: .festival,
        region: "Auvergne-Rhône-Alpes",
        author: users[0],
        geoPoint: CLLocationCoordinate2D(latitude: 45.7640, longitude: 4.8357),
        likeCount: 431
    ),

    Publication(
        image: "https://picsum.photos/seed/art1/800/600",
        title: "Théâtre de rue",
        description: try! AttributedString(markdown: "Des artistes investissent les places publiques avec des performances originales."),
        created_at: .now.addingTimeInterval(-3600 * 72),
        activity: .artVivant,
        region: "Occitanie",
        author: users[0],
        geoPoint: CLLocationCoordinate2D(latitude: 43.6047, longitude: 1.4442),
        likeCount: 192
    ),

    Publication(
        image: "https://picsum.photos/seed/art2/800/600",
        title: "Exposition contemporaine",
        description: try! AttributedString(markdown: "Une collection d'œuvres mêlant **numérique** et peinture traditionnelle."),
        created_at: .now.addingTimeInterval(-3600 * 96),
        activity: .artVisuel,
        region: "Nouvelle-Aquitaine",
        author: users[1],
        geoPoint: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792),
        likeCount: 87
    ),

    Publication(
        image: "https://picsum.photos/seed/history1/800/600",
        title: "Village médiéval",
        description: try! AttributedString(markdown: "Reconstitution historique avec costumes, artisans et démonstrations."),
        created_at: .now.addingTimeInterval(-3600 * 120),
        activity: .reconstitution,
        region: "Normandie",
        author: users[2],
        geoPoint: CLLocationCoordinate2D(latitude: 49.1829, longitude: -0.3707),
        likeCount: 315
    ),

    Publication(
        image: "https://picsum.photos/seed/music2/800/600",
        title: "Jam Session",
        description: try! AttributedString(markdown: "Des musiciens locaux improvisent ensemble dans une ambiance conviviale."),
        created_at: .now.addingTimeInterval(-3600 * 18),
        activity: .musique,
        region: "Provence-Alpes-Côte d'Azur",
        author: users[1],
        geoPoint: CLLocationCoordinate2D(latitude: 43.2965, longitude: 5.3698),
        likeCount: 153
    ),

    Publication(
        image: "https://picsum.photos/seed/gastro2/800/600",
        title: "Atelier pâtisserie",
        description: try! AttributedString(markdown: "Apprentissage des desserts traditionnels avec un chef local."),
        created_at: .now.addingTimeInterval(-3600 * 30),
        activity: .gastronomie,
        region: "Grand Est",
        author: users[2],
        geoPoint: CLLocationCoordinate2D(latitude: 48.5734, longitude: 7.7521),
        likeCount: 209
    )
]
