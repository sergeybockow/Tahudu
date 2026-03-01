//
//  SearchViewModel.swift
//  Tahudu
//
//

import Foundation

class SearchViewModel: ObservableObject {
    
    var models: [Property] = []
    
    init() {
        self.models = Self.mockData()
    }
    
    static func mockData() -> [Property] {
        [Property(
            imageURL: "https://picsum.photos/200/300?random=1",
            type: .apartment,
            price: "2.567.000 AED",
            address: "24E Hightail Point, East Village",
            propertyFeatures: [.liveViewing, .newConstruction, .verified],
            date: Date(timeIntervalSince1970: Double((0...10000000).randomElement()!))
        ),
         Property(
             imageURL: "https://picsum.photos/200/300?random=2",
             type: .house,
             price: "1.987.000 AED",
             address: "20 Sky Large, Canary Wharf",
             propertyFeatures: [.liveViewing, .newConstruction],
             date: Date(timeIntervalSince1970: Double((990...10000000).randomElement()!))
        ),
         Property(
             imageURL: "https://picsum.photos/200/300?random=3",
             type: .apartment,
             price: "2.57.000 AED",
             address: "2E Hightail Point, East Village",
             propertyFeatures: [.liveViewing, .newConstruction],
             date: Date(timeIntervalSince1970: Double((9990...10000000).randomElement()!))
         ),
          Property(
              imageURL: "https://picsum.photos/200/300?random=4",
              type: .house,
              price: "1.987.010 AED",
              address: "23 Sky Large, Canary Wharf",
              propertyFeatures: [.newConstruction],
              date: Date(timeIntervalSince1970: Double((999990...10000000).randomElement()!))
         )
        ]
    }
    
}

