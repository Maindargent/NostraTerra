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
}
