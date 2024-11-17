//
//  GameDetail.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//

import SwiftUI

struct GameDetail: View {
    let game: Game
    var body: some View {
        Form {
            Section {
                LabeledContent("Title", value: game.title)
                LabeledContent("Developer", value: game.developer)
                LabeledContent("Genre", value: game.genre)
                LabeledContent("Release Date", value: game.releaseDate)
            } header: {
                Text("Details")
            }
            Section {
                HStack {
                    VStack {
                        Spacer()
                        Image(game.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        Spacer()
                        Text("Game cover")
                            .font(.footnote)
                            .bold()
                    }
                    VStack {
                        Spacer()
                        Image(game.developerImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        Spacer()
                        Text("Developer logo")
                            .font(.footnote)
                            .bold()
                    }
                }
                .padding(.bottom, 10)
            } header: {
                Text("Cover")
            }
        }
        .navigationTitle("Game Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(
                    Text(game.title),
                    item: Image(game.image),
                    preview:
                        SharePreview(game.title, image: Image(game.image)))
            }
        }
    }
}

#Preview {
    NavigationStack {
        GameDetail(game: .preview)
    }
}
