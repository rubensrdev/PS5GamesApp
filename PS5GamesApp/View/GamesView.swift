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
            List {
                ForEach(gamesVM.games) { game in
                    GameRow(game: game)
                }
                .onDelete(perform: gamesVM.deleteGame)
                .onMove(perform: gamesVM.moveGame)
            }
            .navigationTitle("PS5 Games")
        }
    }
}

#Preview {
    GamesView.preview
}

