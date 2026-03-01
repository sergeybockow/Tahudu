//
//  PropertyCell.swift
//  Tahudu
//
//

import SwiftUI

struct PropertyCell: View {
    
    let property: Property
    
    private let formatter: RelativeDateTimeFormatter = {
        let f = RelativeDateTimeFormatter()
        f.unitsStyle = .full
        return f
    }()
    
    var body: some View {
        VStack(alignment: .leading, content: {
            if let url = URL(string: property.imageURL) {
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                        case .failure(let error):
                            let _ = print("Image error: \(error)")
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 200)
                                .overlay(
                                    Image(systemName: "house")
                                        .foregroundColor(.gray)
                                )
                        @unknown default:
                            EmptyView()
                        }
                    }
                    HStack {
                        ForEach(property.propertyFeatures) { feature in
                            Text(feature.rawValue)
                                .font(.caption2)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                
                                .background(feature.color)
                                .cornerRadius(4)
                        }
                    }
                    .padding(8)
                }
                
            }
            VStack(alignment: .leading, content: {
                Text("\(property.type.rawValue)")
                    .font(.caption)
                Text(property.price)
                    .font(.headline)
                Text("Address \(property.address)")
                    .font(.caption)
            })
            .padding()
            Divider()
            HStack {
                Text("Published \(formatter.localizedString(for: property.date, relativeTo: Date()))")
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
