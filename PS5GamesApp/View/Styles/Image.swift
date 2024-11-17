//
//  Image.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//

import SwiftUI

extension Image {
    func detailImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 200)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
