//
//  FilterMapViewModel.swift
//  Nostra_Terra
//
//  Created by Jules Liegeois on 13/08/2026.
//

import SwiftUI

@Observable
final class FilterMapViewModel {
    var selectedCategory: PublicationCategory?
    var showFilterCategories: Bool = false
    
    var selectedRegion: FrenchRegion?
    var showFilterRegionSheet: Bool = false
}
