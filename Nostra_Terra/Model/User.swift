//
//  User.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 21/07/2026.
//

import SwiftUI
import PhotosUI

struct User: Identifiable {
    let id = UUID()
    var lastName: String
    var firstName: String
    var birthDate: Date
    var description: String
    var profilPicture: URL?
    var uploadedImage: PhotosPickerItem?
    var likedPublication: [(any Publication)] = []
    var publishedPublication: [(any Publication)] = []
}
