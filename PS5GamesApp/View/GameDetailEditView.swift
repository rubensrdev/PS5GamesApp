//
//  GameDetailEditView.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//

import SwiftUI

struct GameDetailEditView: View {
    
    @ObservedObject var vm: GameEditViewModel
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("Game title")
                    .bold()
                TextField("Enter the game title", text: $vm.title )
            }
        }
    }
}

#Preview {
    GameDetailEditView.preview
}
