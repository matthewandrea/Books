//
//  BookStoreView.swift
//  Books
//
//  Created by Matthew Andrea D'Alessio on 13/11/23.
//

import SwiftUI

struct BookStoreView: View {
    
    var viewModel = BookViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Divider()
                    .frame(width: 360)
                
                NavigationLink(destination: BrowseSectionsView()) {
                    HStack {
                        Image(systemName: "text.justifyleft")
                            .imageScale(.large)
                        Text("Browse Sections")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.forward")
                            .imageScale(.small)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                Divider()
                    .frame(width: 360)
            }
            
            // inserisci i libri in evidenza qui
            
            VStack (alignment: .leading) {
                Text ("New & Trending")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text ("Recently released and buzz-y books.")
                    .font(.subheadline)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 15) {
                    ForEach(viewModel.books1) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            Image(book.cover)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .padding(.leading, 15)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(maxHeight: 110)
                
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 12) {
                    ForEach(viewModel.books2) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            Image(book.cover)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .padding(.leading, 15)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(maxHeight: 110)
                
            }
            
            VStack {
                Divider()
                    .frame(width: 360)
                
                Button {
                        // No action
                    } label: {
                        HStack {
                            Text("See All")
                            
                            Image(systemName: "chevron.forward")
                                .imageScale(.small)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 30)
                }
            
            .navigationTitle("Book Store")
            Spacer()
        }
        
    }
}

#Preview {
    BookStoreView()
}
