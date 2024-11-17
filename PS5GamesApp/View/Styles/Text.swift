//
//  Text.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//

import SwiftUI

extension View {
    func capsuleStyle() -> some View {
        self
            .padding(2.5)
            .background(Color.secondary.opacity(0.1))
            .clipShape(.capsule)
    }
}
