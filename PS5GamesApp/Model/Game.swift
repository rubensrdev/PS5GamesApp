//
//  Game.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//
import Foundation

struct Game: Codable, Identifiable {
    var id: UUID
    let title: String
    let genre: String
    let developer: String
    let releaseDate: String
    let rating: Double
    let image: String
    let developerImage: String
    let pressComments: [String]
}

typealias Games = [Game]
