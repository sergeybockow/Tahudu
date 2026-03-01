//
//  PropertyCell.swift
//  Tahudu
//
//

import SwiftUI

struct PropertyCell: View {
    
    private let property: Property
    
    init(property: Property) {
        self.property = property
    }
    
    var body: some View {
        VStack(alignment: .leading, content: {
            if let url = URL(string: property.imageURL) {
                ZStack {
                    AsyncImage(url: url) { result in
                        switch result {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().scaledToFill()
                        case .failure(let error):
                            Image(systemName: "xmark.octagon")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.red)
                        @unknown default:
                            Image(systemName: "questionmark")
                        }
                    }
                    VStack {
                        List(property.propertyFeatures) {
                            Text($0.rawValue)
                                .font(.caption2)
                                .background($0.color)
                        }
                    }
                }
                
            }
            VStack(alignment: .leading, content: {
                Text("Apartment \(property.type.rawValue)")
                    .font(.caption)
                Text(property.price)
                    .font(.headline)
                Text("Address \(property.address)")
                    .font(.caption)
            })
            .padding()
            Divider()
            HStack {
                Text("Published \(property.date.formatted()) ago")
                    .font(.caption)
                Spacer()
                ContactButton(.phone) {
                    
                }
                ContactButton(.email) {
                    
                }
                ContactButton(.whatsApp) {
                    
                }
            }
            .padding()
        })
        .border(.gray, width: 1)
        .padding(0)
    }
    
}
