//
//  ContentView.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 13/11/24.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var gamesVM = GamesViewModel()
    
    var body: some View {
        NavigationStack {
            //SearchBar(search: $gamesVM.search)
            List {
                ForEach(gamesVM.filteredGames) { game in
                    NavigationLink(value: game) {
                        GameRow(game: game)
                    }
                }
                .onDelete(perform: gamesVM.deleteGame)
                .onMove(perform: gamesVM.moveGame)
            }
            .navigationTitle("PS5 Games")
            .navigationDestination(for: Game.self, destination: { game in
                GameDetail(game: game)
            })
            .searchable(text: $gamesVM.search, prompt: "Search a game title") {
                ForEach(gamesVM.developers, id: \.self) { developer in
                    Text(developer)
                        .searchCompletion("🎮 \(developer)")
                }
            }
            .orderButton(order: $gamesVM.orderOption)
        }
    }
}

#Preview {
    GamesView.preview
}

