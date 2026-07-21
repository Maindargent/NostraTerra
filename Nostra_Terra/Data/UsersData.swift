//
//  User.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//

import Foundation

let users: [User] = [
    User(
        lastName: "Martin",
        firstName: "Lucas",
        birthDate: Calendar.current.date(from: DateComponents(year: 1995, month: 3, day: 12))!,
        description: "Passionné de randonnée et de photographie.",
        profilPicture: URL(string: "https://picsum.photos/seed/user1/300/300")!
    ),
    User(
        lastName: "Bernard",
        firstName: "Emma",
        birthDate: Calendar.current.date(from: DateComponents(year: 1998, month: 7, day: 24))!,
        description: "Amatrice de cuisine italienne et de voyages.",
        profilPicture: URL(string: "https://picsum.photos/seed/user2/300/300")!
    ),
    User(
        lastName: "Dubois",
        firstName: "Hugo",
        birthDate: Calendar.current.date(from: DateComponents(year: 1992, month: 11, day: 8))!,
        description: "Développeur Swift et fan de café.",
        profilPicture: URL(string: "https://picsum.photos/seed/user3/300/300")!
    ),
    User(
        lastName: "Thomas",
        firstName: "Chloé",
        birthDate: Calendar.current.date(from: DateComponents(year: 1997, month: 1, day: 17))!,
        description: "Toujours un livre à la main.",
        profilPicture: URL(string: "https://picsum.photos/seed/user4/300/300")!
    ),
    User(
        lastName: "Robert",
        firstName: "Nathan",
        birthDate: Calendar.current.date(from: DateComponents(year: 1994, month: 5, day: 2))!,
        description: "Sportif et amateur de cinéma.",
        profilPicture: URL(string: "https://picsum.photos/seed/user5/300/300")!
    ),
    User(
        lastName: "Richard",
        firstName: "Léa",
        birthDate: Calendar.current.date(from: DateComponents(year: 2000, month: 9, day: 14))!,
        description: "Créative, adore le dessin numérique.",
        profilPicture: URL(string: "https://picsum.photos/seed/user6/300/300")!
    ),
    User(
        lastName: "Petit",
        firstName: "Gabriel",
        birthDate: Calendar.current.date(from: DateComponents(year: 1993, month: 12, day: 21))!,
        description: "Fan de jeux vidéo et de musique.",
        profilPicture: URL(string: "https://picsum.photos/seed/user7/300/300")!
    ),
    User(
        lastName: "Durand",
        firstName: "Camille",
        birthDate: Calendar.current.date(from: DateComponents(year: 1999, month: 4, day: 30))!,
        description: "Aime les animaux et la nature.",
        profilPicture: URL(string: "https://picsum.photos/seed/user8/300/300")!
    ),
    User(
        lastName: "Leroy",
        firstName: "Louis",
        birthDate: Calendar.current.date(from: DateComponents(year: 1991, month: 6, day: 18))!,
        description: "Passionné de nouvelles technologies.",
        profilPicture: URL(string: "https://picsum.photos/seed/user9/300/300")!
    ),
    User(
        lastName: "Moreau",
        firstName: "Sarah",
        birthDate: Calendar.current.date(from: DateComponents(year: 1996, month: 8, day: 9))!,
        description: "Voyageuse dans l'âme.",
        profilPicture: URL(string: "https://picsum.photos/seed/user10/300/300")!
    ),
    User(
        lastName: "Simon",
        firstName: "Jules",
        birthDate: Calendar.current.date(from: DateComponents(year: 1990, month: 2, day: 5))!,
        description: "Cycliste et amateur de gastronomie.",
        profilPicture: URL(string: "https://picsum.photos/seed/user11/300/300")!
    ),
    User(
        lastName: "Laurent",
        firstName: "Manon",
        birthDate: Calendar.current.date(from: DateComponents(year: 1998, month: 10, day: 11))!,
        description: "Danseuse et passionnée de mode.",
        profilPicture: URL(string: "https://picsum.photos/seed/user12/300/300")!
    ),
    User(
        lastName: "Michel",
        firstName: "Noah",
        birthDate: Calendar.current.date(from: DateComponents(year: 2001, month: 1, day: 28))!,
        description: "Étudiant en informatique.",
        profilPicture: URL(string: "https://picsum.photos/seed/user13/300/300")!
    ),
    User(
        lastName: "Garcia",
        firstName: "Inès",
        birthDate: Calendar.current.date(from: DateComponents(year: 1995, month: 7, day: 7))!,
        description: "Fan de yoga et de méditation.",
        profilPicture: URL(string: "https://picsum.photos/seed/user14/300/300")!
    ),
    User(
        lastName: "David",
        firstName: "Arthur",
        birthDate: Calendar.current.date(from: DateComponents(year: 1992, month: 3, day: 15))!,
        description: "Musicien pendant son temps libre.",
        profilPicture: URL(string: "https://picsum.photos/seed/user15/300/300")!
    ),
    User(
        lastName: "Roux",
        firstName: "Clara",
        birthDate: Calendar.current.date(from: DateComponents(year: 1997, month: 11, day: 19))!,
        description: "Adepte des week-ends en montagne.",
        profilPicture: URL(string: "https://picsum.photos/seed/user16/300/300")!
    ),
    User(
        lastName: "Vincent",
        firstName: "Tom",
        birthDate: Calendar.current.date(from: DateComponents(year: 1994, month: 5, day: 27))!,
        description: "Passionné par les startups.",
        profilPicture: URL(string: "https://picsum.photos/seed/user17/300/300")!
    ),
    User(
        lastName: "Fournier",
        firstName: "Élise",
        birthDate: Calendar.current.date(from: DateComponents(year: 1999, month: 9, day: 4))!,
        description: "Photographe amateur et gourmande.",
        profilPicture: URL(string: "https://picsum.photos/seed/user18/300/300")!
    ),
    User(
        lastName: "Girard",
        firstName: "Mathis",
        birthDate: Calendar.current.date(from: DateComponents(year: 1993, month: 6, day: 10))!,
        description: "Fan de science-fiction.",
        profilPicture: URL(string: "https://picsum.photos/seed/user19/300/300")!
    ),
    User(
        lastName: "Bonnet",
        firstName: "Zoé",
        birthDate: Calendar.current.date(from: DateComponents(year: 2000, month: 12, day: 1))!,
        description: "Toujours prête pour une aventure.",
        profilPicture: URL(string: "https://picsum.photos/seed/user20/300/300")!
    )
]
