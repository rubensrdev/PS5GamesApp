//
//  RepositoryProtocol.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 16/11/24.
//
import Foundation

protocol RepositoryProtocol {
    var url: URL { get }
    var urlDoc: URL { get }
}

extension RepositoryProtocol {
    func loadJSON<T>() throws -> T where T: Decodable {
        var fileURL = url
        if FileManager.default.fileExists(atPath: urlDoc.path()) {
            fileURL = urlDoc
        }
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func saveJSON<T>(_ object: T) throws where T: Encodable {
        let data = try JSONEncoder().encode(object)
        try data.write(to: urlDoc, options: [.atomic, .completeFileProtection])
    }
}
