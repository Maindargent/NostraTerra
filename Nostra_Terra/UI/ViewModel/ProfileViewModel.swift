//
//  ProfileViewModel.swift
//  Nostra_Terra
//
//  Created by ShoSho on 08/08/2026.
//

import SwiftUI

@Observable
final class ProfileViewModel {
    
    var profileUser = users
    
    var age: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: profileUser[0].birthDate, to: .now)
    }
    
    func editUser(user: User) {
        profileUser[0] = user
    }
    
}
