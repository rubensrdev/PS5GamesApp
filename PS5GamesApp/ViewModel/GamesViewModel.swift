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
    
    @Published var search: String = ""
    
    var filteredGames: Games {
        games.filter { game in
            if search.isEmpty {
                true
            } else {
                game.title.localizedCaseInsensitiveContains(search)
            }
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
    
    func deleteGame(indexSet: IndexSet) {
        if search.isEmpty {
            games.remove(atOffsets: indexSet)
        } else {
            for index in indexSet {
                let id = filteredGames[index].id
                games.removeAll { $0.id == id }
            }
        }
    }
    
    func moveGame(indexSet: IndexSet, to: Int) {
        games.move(fromOffsets: indexSet, toOffset: to)
    }
}
