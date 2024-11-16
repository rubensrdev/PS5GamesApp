//
//  GameViewModel.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//

import Foundation

final class GamesViewModel: ObservableObject {
    
    let repository: Repository
    
    @Published var games: Games {
        didSet {
            repository.saveJSON(games: games)
        }
    }
    
    init(repository: Repository = .init()) {
        self.repository = repository
        self.games = repository.loadJSON()
    }
    
}
