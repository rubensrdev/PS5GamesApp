//
//  GameViewModel.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//

import Foundation

final class GamesViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    
    @Published var games: Games {
        didSet {
           try? repository.saveJSON(games)
        }
    }
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        do {
            self.games = try repository.loadJSON()
        } catch {
            self.games = []
        }
    }
    
}
