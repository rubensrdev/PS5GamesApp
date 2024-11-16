//
//  ContentView.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var gamesVM = GamesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(gamesVM.games) { game in
                    Text(game.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
