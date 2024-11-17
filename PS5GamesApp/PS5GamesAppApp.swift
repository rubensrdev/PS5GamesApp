//
//  PS5GamesAppApp.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 13/11/24.
//

import SwiftUI

@main
struct PS5GamesAppApp: App {
    var body: some Scene {
        WindowGroup {
            GamesListView()
                .onAppear {
                    print("URL DOC directory: \(URL.documentsDirectory)")
                }
        }
    }
}
