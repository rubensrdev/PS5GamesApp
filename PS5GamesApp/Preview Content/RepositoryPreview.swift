//
//  RepositoryPreview.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//


struct RepositoryPreview: RepositoryProtocol {
    var url: URL {
        Bundle.main.url(forResource: "gamesPreview", withExtension: "json")!
    }
}
