//
//  OrderOptions.swift
//  PS5GamesApp
//
//  Created by Rubén Segura Romo on 17/11/24.
//
import SwiftUI

struct OrderButtonModifier: ViewModifier {
    @Binding var orderOption: OrderOptions
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(OrderOptions.allCases) { order in
                            Button {
                                orderOption = order
                            } label: {
                                Text(order.rawValue)
                            }

                        }
                    } label: {
                        Text("Order by")
                    }

                }
            }
    }
}

extension View {
    func orderButton(order: Binding<OrderOptions>) -> some View {
        modifier(OrderButtonModifier(orderOption: order))
    }
}

enum OrderOptions: String, CaseIterable, Identifiable {
    case byTitleAsc = "By title Ascending"
    case byTitleDesc = "By title Descending"
    case byDeveloper = "By developer company"
    case byReleaseDate = "By release date"
    case byId = "Default order"
    
    var id: Self { self }
}
