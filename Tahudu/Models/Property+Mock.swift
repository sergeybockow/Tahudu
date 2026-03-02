//
//  Property+Mock.swift
//  Tahudu
//
//  Created by Сергей Бочков on 01.03.2026.
//

import Foundation

extension Property {
    static func mockData() -> [Property] {
        [Property(
            imageURLs: [
                "https://picsum.photos/200/300?random=1",
                "https://picsum.photos/200/300?random=2",
                "https://picsum.photos/200/300?random=3",
            ],
            type: .apartment,
            price: "2.567.000 AED",
            address: "24E Hightail Point, East Village",
            propertyFeatures: [.liveViewing, .newConstruction, .verified],
            date: Date(timeIntervalSince1970: Double((0...10000000).randomElement()!))
        ),
         Property(
            imageURLs: [
                "https://picsum.photos/200/300?random=4",
                "https://picsum.photos/200/300?random=5",
                "https://picsum.photos/200/300?random=6",
            ],
            type: .house,
            price: "1.987.000 AED",
            address: "20 Sky Large, Canary Wharf",
            propertyFeatures: [.liveViewing, .newConstruction],
            date: Date(timeIntervalSince1970: Double((990...10000000).randomElement()!))
         ),
         Property(
            imageURLs: [
                "https://picsum.photos/200/300?random=7",
                "https://picsum.photos/200/300?random=8",
                "https://picsum.photos/200/300?random=9",
            ],
            type: .apartment,
            price: "2.57.000 AED",
            address: "2E Hightail Point, East Village",
            propertyFeatures: [.liveViewing, .newConstruction],
            date: Date(timeIntervalSince1970: Double((9990...10000000).randomElement()!))
         ),
         Property(
            imageURLs: [
                "https://picsum.photos/200/300?random=10",
                "https://picsum.photos/200/300?random=11",
                "https://picsum.photos/200/300?random=12",
            ],
            type: .house,
            price: "1.987.010 AED",
            address: "23 Sky Large, Canary Wharf",
            propertyFeatures: [.newConstruction],
            date: Date(timeIntervalSince1970: Double((999990...10000000).randomElement()!))
         )
        ]
    }
}
