//
//  SearchBar.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//
import SwiftUI

struct SearchBar: View {
    @Binding var search: String
    var body: some View {
        HStack {
            TextField("Search", text: $search)
            if !search.isEmpty {
                Button {
                    search = ""
                } label: {
                    Image(systemName: "xmark")
                        .symbolVariant(.fill)
                        .symbolVariant(.circle)
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            } else {
                Image(systemName: "magnifyingglass")
            }
            
        }
        .padding()
        .background {
            Color(white: 0.9)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}
