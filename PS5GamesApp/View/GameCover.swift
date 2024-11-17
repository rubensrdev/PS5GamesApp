//
//  GameCover.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//
import SwiftUI

struct GameCover: View {
    let gameImage: String
    var body: some View {
        Image(gameImage)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 75)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    GameCover(gameImage: "god-of-war")
}
