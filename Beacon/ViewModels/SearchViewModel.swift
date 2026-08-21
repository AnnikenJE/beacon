//
//  SearchViewModel.swift
//  Beacon
//
// Kandidatnr 97

// ViewModel for search in ExploreView. Debouncing.

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var debouncedText = ""
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .assign(to: &$debouncedText)
    }
}
