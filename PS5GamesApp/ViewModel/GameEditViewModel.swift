//
//  GameEditViewModel.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//

import Foundation

struct PressComment: Identifiable {
    let id = UUID()
    var comment: String
}

final class GameEditViewModel: ObservableObject {
    
    let game: Game
    
    @Published var title: String
    @Published var genre: String
    @Published var developer: String
    @Published var rating: Double
    @Published var pressComments: [PressComment]
    
    init (game: Game) {
        self.game = game
        title = game.title
        genre = game.genre
        developer = game.developer
        rating = game.rating
        pressComments = game.pressComments.map { PressComment(comment: $0) }
    }
}
