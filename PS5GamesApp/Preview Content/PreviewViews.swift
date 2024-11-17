//
//  PreviewViews.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//
import SwiftUI

extension GamesListView {
    static var preview: some View {
        GamesListView()
            .environmentObject(GamesViewModel(repository: RepositoryPreview()))
    }
}

extension Game {
    static let preview = Game(
        id: UUID(), title: "The Last of Us Part I",
        genre: "Action-Adventure",
        developer: "Naughty Dog",
        releaseDate: "2022-09-02",
        rating: 9.5,
        image: "the-last-of-us-p1",
        developerImage: "naughty-dog",
        pressComments: [
            "A stunning remake of a modern classic.",
            "Heartbreaking and immersive storytelling.",
            "Naughty Dog's attention to detail is unparalleled."
        ]
    )
}

extension GameDetailEditView {
    static let preview = GameDetailEditView(vm: GameEditViewModel(game: .preview))
}
