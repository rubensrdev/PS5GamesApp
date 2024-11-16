//
//  RepositoryPreview.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//
import Foundation

struct RepositoryPreview: RepositoryProtocol {
    var url: URL {
        Bundle.main.url(forResource: "gamesPreview", withExtension: "json")!
    }
    var urlDoc: URL {
        .documentsDirectory.appending(path: "/gamesPreview.json")
    }
}
