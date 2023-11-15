//
//  BrowseSectionsView.swift
//  Books
//
//  Created by Matthew Andrea D'Alessio on 14/11/23.
//

import SwiftUI

struct BrowseSectionsView: View {
    
    var viewModel = SectionsViewModel()
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.sections.prefix(2)) { section in
                    NavigationLink(destination: SectionsDetailView(category: section.category)) {
                        HStack {
                            Image(systemName: section.emoji)
                                .imageScale(.large)
                                .frame(width: 40, height: 40)
                            Text(section.category)
                        }
                        .frame(height: 40)
                    }
                }

                Text("GENERES")
                    .font(.subheadline)
                    .padding(.vertical, 16)

                ForEach(viewModel.sections.dropFirst(2)) { section in
                    NavigationLink(destination: SectionsDetailView(category: section.category)) {
                        HStack {
                            Image(systemName: section.emoji)
                                .imageScale(.large)
                                .frame(width: 40, height: 40)
                            Text(section.category)
                        }
                        .frame(height: 40)
                    }
                }
            }
            .listStyle(InsetListStyle())
        }
        .navigationTitle("Browse Sections")
    }
}

#Preview {
    BrowseSectionsView()
}