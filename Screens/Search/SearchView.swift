//
//  SearchView.swift
//  Tahudu
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ClearableTextField(label: "City, area or building", text: $text)
                    .padding()
                
                List(viewModel.models) { property in
                    PropertyCell(property: property)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button("", systemImage: "pencil") { print("filter") }
                        Button("", systemImage: "trash") { print("filter") }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "star") { print("star") }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {

    @Binding var text: String

    static var previews: some View {
        SearchView()
    }
}
