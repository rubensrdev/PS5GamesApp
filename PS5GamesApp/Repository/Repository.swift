//
//  Repository.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//

import Foundation

protocol RepositoryProtocol {
    var url: URL { get }
    func loadJSON() -> Games
    func saveJSON(games: Games)
}

extension RepositoryProtocol {
    func loadJSON() -> Games {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(Games.self, from: data)
        } catch {
            print(error)
        }
        return []
    }
    
    func saveJSON(games: Games) {
        
    }
}

struct Repository: RepositoryProtocol {
    var url: URL {
        Bundle.main.url(forResource: "games", withExtension: "json")!
    }
}


