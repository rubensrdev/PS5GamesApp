//
//  GameRow.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//
import SwiftUI

struct GameRow: View {
    let game: Game
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(game.title)
                    .font(.headline)
                Text(game.developer)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                HStack {
                    Text(game.releaseDate)
                        .capsuleStyle()
                    Text(game.ratingFormatted)
                        .capsuleStyle()
                }
                .font(.caption)
            }
            .padding(.vertical,20)
            Spacer()
            Image(game.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 75)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    List {
        GameRow(game: .preview)
    }
}
