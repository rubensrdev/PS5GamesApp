//
//  Repository.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//

import Foundation

struct Repository: RepositoryProtocol {
    var url: URL {
        Bundle.main.url(forResource: "games", withExtension: "json")!
    }
    var urlDoc: URL {
        .documentsDirectory.appending(path: "/games.json")
    }
}


