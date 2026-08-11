//
//  FormPublicationVM.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 06/08/2026.
//

import SwiftUI
import PhotosUI
import MapKit

@Observable
final class FormPublicationVM {
    var typeForm: TypeForm = .tradition
    var title: String = ""
    var startDate: Date = .now
    var endDate: Date = .now
    var selectedItems: [PhotosPickerItem] = []
    var description: String = ""
    var selectedCategories = Set<PublicationCategory>()
    var region: FrenchRegion?
    var selectedGeoPoint: CLLocationCoordinate2D?
    
    var isTitleValid: Bool {
        return !title.isEmpty && title.count > 4
    }
    
    var isEndDateValid: Bool {
        guard typeForm == .event else {
            return true
        }
        return endDate > startDate
    }
    var isSelectedItemsValid: Bool {
        return selectedItems.count > 0
    }
    var isDescriptionValid: Bool {
        return !description.isEmpty && description.count > 10
    }
    var isSelectedCategoriesValid: Bool {
        return selectedCategories.count > 0
    }
    var isRegionValid: Bool {
        guard region != nil else {
            return false
        }
        return true
    }
    
    var isSelectedGeoPointValid: Bool {
        return selectedGeoPoint != nil
    }
    
    var isFormValid: Bool {
        return isTitleValid && isEndDateValid && isSelectedItemsValid && isDescriptionValid && isSelectedCategoriesValid && isRegionValid && isSelectedGeoPointValid
    }
    
    var getPublication: (any Publication)? {
        if typeForm == .event {
            return Event(
                image: URL(string: "https://google.fr")!,
                uploadedImages: selectedItems,
                title: title,
                description: description,
                created_at: .now,
                categories: Array(selectedCategories),
                region: region!,
                author: users[0],
                geoPoint: selectedGeoPoint!,
                likeCount: 0,
                startDate: startDate,
                endDate: endDate)
        } else if typeForm == .tradition {
            return Tradition(
                image: URL(string: "https://google.fr")!,
                uploadedImages: selectedItems,
                title: title,
                description: description,
                created_at: .now,
                categories: Array(selectedCategories),
                region: region!,
                author: users[0],
                geoPoint: selectedGeoPoint!,
                likeCount: 0)
        } else {
            return nil
        }
    }
    
    func reset() {
        typeForm = .tradition
        title = ""
        startDate = .now
        endDate = .now
        selectedItems = []
        description = ""
        selectedCategories = Set<PublicationCategory>()
        region = nil
        selectedGeoPoint = nil
    }
    
    func fillWithMockData() {
        typeForm = .tradition
        title = "Kebab"
        startDate = .now
        endDate = .now
        description = "Le kebab, spécialité de Marseille (faux) mais on aime quand meme"
        selectedCategories = [PublicationCategory.gastronomie, PublicationCategory.artVivant, PublicationCategory.artVisuel]
        region = FrenchRegion.provenceAlpesCoteDAzur
        selectedGeoPoint = CLLocationCoordinate2D(latitude: 43.279370, longitude: 5.409855)
    }
}
