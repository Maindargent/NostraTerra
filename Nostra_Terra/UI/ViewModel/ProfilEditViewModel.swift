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
    var isBirthDate: Bool {
        return birthDate < .now
    }
    var isUploeadedImage: Bool {
        return uploadedImage != nil
    }
    
    var isFirstNameValid: Bool {
        return !firstName.isEmpty
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
}
