//
//  User.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//

import Foundation


struct User: Identifiable {
    let id = UUID()
    let lastName: String
    let firstName: String
    let birthDate: Date
    let description: String
    let profilPicture: URL
    let likedPublication: [Publication] = []
    let publishedPublication: [Publication] = []
}


