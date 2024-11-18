//
//  GameDetailEditView.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//

import SwiftUI

struct GameDetailEditView: View {
    @EnvironmentObject private var gamesVM: GamesViewModel
    @ObservedObject var vm: GameEditViewModel
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("Game title")
                    .bold()
                TextField("Enter the game title", text: $vm.title )
                    .textInputAutocapitalization(.words)
                    .accessibilityLabel(Text("Title of the game"))
                Divider()
                Text("Game genre")
                    .bold()
                TextField("Enter the game genre", text: $vm.genre )
                    .accessibilityLabel(Text("Genre of the game"))
                Divider()
                Text("Game developer")
                    .bold()
                Picker(selection: $vm.developer) {
                    ForEach(gamesVM.developers, id: \.self) { developer in
                        Text(developer)
                    }
                } label: {
                    Text("Developer")
                }
                .accessibilityLabel("Developer company of the game")
                //.pickerStyle(.navigationLink)
                Divider()
                Text("Game rating")
                    .bold()
                TextField("Enter the game developer",
                          value: $vm.rating,
                          format: .number.precision(.integerAndFractionLength(integer: 1, fraction: 1)))
                    .keyboardType(.numberPad)
                    .accessibilityLabel(Text("Rating of the game"))
                Divider()
                Text("Press comments")
                    .bold()
                ForEach($vm.pressComments) { $pressComment in
                    TextField("Enter the comment", text: $pressComment.comment)
                        .accessibilityLabel(Text("Comment of the game"))
                }
            }
        }
        .navigationTitle("Edit game")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Validation alert", isPresented: $vm.showAlert, actions: {}, message: {
            Text(vm.errorMsg)
        })
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    if let updatedGame = vm.validateGame() {
                        gamesVM.updateGame(game: updatedGame)
                    }
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        GameDetailEditView.preview
    }
}
