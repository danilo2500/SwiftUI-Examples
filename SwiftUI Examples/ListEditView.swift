//
//  ListEditView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 17/11/25.
//

import SwiftUI

struct ListEditView: View {
    @State private var fruits = [
        "🍎 Apple",
        "🍌 Banana",
        "🥭 Papaya",
        "🍇 Grapes",
        "🍊 Orange",
        "🍓 Strawberry",
        "🍑 Peach",
        "🍐 Pear",
        "🥝 Kiwi",
        "🍉 Watermelon",
        "🍍 Pineapple",
        "🥥 Coconut",
        "🫐 Blueberry",
        "🍒 Cherry",
        "🍋 Lemon",
        "🥑 Avocado",
        "🫒 Olive",
        "🌶️ Pepper"
    ]


    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete { fruits.remove(atOffsets: $0) }
                .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ListEditView()
}
