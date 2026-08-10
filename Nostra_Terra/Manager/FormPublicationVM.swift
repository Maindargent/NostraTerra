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
    var region: String = ""
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
        return !region.isEmpty
    }
    var isSelectedGeoPointValid: Bool {
        return selectedGeoPoint != nil
    }
    
    var isFormValid: Bool {
        return isTitleValid &&
                isEndDateValid &&
                isSelectedItemsValid &&
                isDescriptionValid &&
                isSelectedCategoriesValid &&
                isRegionValid &&
                isSelectedGeoPointValid
    }
}
