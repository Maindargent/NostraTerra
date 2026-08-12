//
//  ProfilEditViewModel.swift
//  Nostra_Terra
//
//  Created by Apprenant 87 on 12/08/2026.
//

import SwiftUI
import PhotosUI

@Observable
final class ProfilEditViewModel {
    var lastName: String = ""
    var firstName: String = ""
    var birthDate: Date = Calendar.current.date(byAdding: .year, value: -10, to: Date())!
    var description: String = ""
    var uploadedImage: PhotosPickerItem?
    
    func setData(user: User) {
        self.lastName = user.lastName
        self.firstName = user.firstName
        self.birthDate = user.birthDate
        self.description = user.description
    }
    
    var isLastNameValid: Bool {
        return !lastName.isEmpty
    }
    var isFirstNameValid: Bool {
        return !firstName.isEmpty
    }
    var isBirthDate: Bool {
        return birthDate < .now
    }
    var isUploeadedImage: Bool {
        return uploadedImage != nil
    }
    var isFormValid: Bool{
        return isLastNameValid && isFirstNameValid && isBirthDate
    }
    
    var getUser: User? {
        if isFormValid {
            if uploadedImage != nil {
                return User(
                    lastName: lastName,
                    firstName: firstName,
                    birthDate: birthDate,
                    description: description,
                    uploadedImage: uploadedImage
                )
            } else {
                return User(
                    lastName: lastName,
                    firstName: firstName,
                    birthDate: birthDate,
                    description: description,
                    profilPicture: URL(string: "https://picsum.photos/seed/user1/300/300")!
                )
            }
        } else {
            return nil
        }
    }
    
    func reset() {
        lastName = ""
        firstName = ""
        birthDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())!
        description = ""
        uploadedImage = nil
    }
    
    func fillWithMockData() {
        lastName = "Yann"
        firstName = "Swifties"
        birthDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())!
        description = "Yann, aka le Swiftie ultime, Passionné par Swift et grand fan de Taylor Swift, je passe mon temps à coder et écouter ses albums. Entre lignes de code et paroles de chansons, je vis pleinement ma double passion ! 💻🩵"
    }
}
