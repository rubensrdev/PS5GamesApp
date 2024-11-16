//
//  Repository.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//

import Foundation

struct Repository {
    
    
    var url: URL {
        Bundle.main.url(forResource: "games", withExtension: "json")!
    }
    
    func loadJSON() -> [Game] {
        do {
            let data = try Data(contentsOf: url)
            print("data cargada ✅")
            return try JSONDecoder().decode(Games.self, from: data)
        } catch {
            print(error)
        }
        print("data no cargada ❌")
        return []
    }
    
    func saveJSON(games: Games) {
        
    }
    
}
