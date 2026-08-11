//
//  User.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//

import Foundation

let users: [User] = [
    User(
        lastName: "Swift",
        firstName: "Yann",
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
    )
]
