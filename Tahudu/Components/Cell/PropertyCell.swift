//
//  PropertyCell.swift
//  Tahudu
//
//

import SwiftUI

struct PropertyCell: View {
    
    private enum Constants {
        static let imageHeight: CGFloat = 200
        static let cornerRadius: CGFloat = 4
        static let padding: CGFloat = 8
    }
    
    @State private var isAnimating = false
    
    let property: Property
    
    private let formatter: RelativeDateTimeFormatter = {
        let f = RelativeDateTimeFormatter()
        f.unitsStyle = .full
        return f
    }()
    
    var body: some View {
        VStack(alignment: .leading, content: {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(property.imageURLs, id: \.self) { urlString in
                        if let url = URL(string: urlString) {
                            ZStack(alignment: .bottomLeading) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        Rectangle()
                                            .fill(Color.gray)
                                            .frame(width: UIScreen.main.bounds.width, height: Constants.imageHeight)
                                            .opacity(isAnimating ? 0.3 : 0.6)
                                            .animation(.easeInOut(duration: 0.8).repeatForever(), value: isAnimating)
                                            .onAppear { isAnimating = true }
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width, height: Constants.imageHeight)
                                            .clipped()
                                    case .failure(let error):
                                        let _ = print("Image error: \(error)")
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(height: Constants.imageHeight)
                                            .overlay(
                                                Image(systemName: "house")
                                                    .foregroundColor(.gray)
                                            )
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
            
            HStack {
                ForEach(property.propertyFeatures) { feature in
                    Text(feature.displayName)
                        .font(.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                    
                        .background(feature.color)
                        .cornerRadius(Constants.cornerRadius)
                }
            }
            .padding(Constants.padding)
            
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
