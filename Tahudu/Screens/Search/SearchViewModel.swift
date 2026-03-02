//
//  SearchViewModel.swift
//  Tahudu
//
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var models: [Property] = []
    
    init() {
        Task {
            await loadProperties()
        }
    }
    
    func loadProperties() async {
        models = Property.mockData()
    }
}

