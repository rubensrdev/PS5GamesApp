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
    
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    init (game: Game) {
        self.game = game
        title = game.title
        genre = game.genre
        developer = game.developer
        rating = game.rating
        pressComments = game.pressComments.map { PressComment(comment: $0) }
    }
    
    func validateGame() -> Game? {
        var errorMessageCompound: String = ""
        if title.isEmpty {
            errorMessageCompound += "The title cannot be empty. \n"
        }
        if genre.isEmpty {
            errorMessageCompound += "The genre cannot be empty. \n"
        }
        if rating < 0 || rating > 10 {
            errorMessageCompound += "The rating must be between 0 and 10. \n"
        }
        if pressComments.isEmpty {
            errorMessageCompound += "At least one press comment is required. \n"
        } else if pressComments.contains(where: { comment in
            comment.comment.isEmpty
        }) {
            errorMessageCompound += "Any press comment cannot be empty. \n"
        }
        
        if errorMessageCompound.isEmpty {
           return Game(id: game.id, title: title, genre: genre, developer: developer, releaseDate: game.releaseDate, rating: rating, image: game.image, developerImage: game.developerImage, pressComments: pressComments.map{ $0.comment })
        } else {
            errorMsg = String(errorMessageCompound.dropLast())
            showAlert.toggle()
            return nil
        }
    }
}
