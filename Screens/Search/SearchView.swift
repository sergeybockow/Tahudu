//
//  SearchView.swift
//  Tahudu
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button("", systemImage: "pencil") {
                    print("filter")
                }
                Button("", systemImage: "trash") {
                    print("filter")
                }
                Spacer()
                Button("", systemImage: "star") {
                    print("star")
                }
            }
            .padding()
            ClearableTextField(label: "City, area or building", text: $text)
                .padding()
            
            List(viewModel.models) { property in
                PropertyCell(property: property)
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
