//
//  Property.swift
//  Tahudu
//
//

import Foundation
import SwiftUI

struct Property: Identifiable {
    
    var id = UUID()
    
    enum PropertyType: String {
        case apartment
        case house
    }
    
    enum PropertyFeature: String, Identifiable {
        
        case verified
        case newConstruction
        case liveViewing
        
        var id: String { return rawValue }
        
        var displayName: String {
            switch self {
            case .verified: return "Verified"
            case .newConstruction: return "New Construction"
            case .liveViewing: return "Live Viewing"
            }
        }
        
        var color: Color {
            switch self {
            case .verified:
                return .green
            case .newConstruction:
                return .red
            case .liveViewing:
                return .gray
            }
        }
    }
    
    let imageURLs: [String]
    let type: PropertyType
    let price: String
    let address: String
    let propertyFeatures: [PropertyFeature]
    let date: Date
    
    
}
