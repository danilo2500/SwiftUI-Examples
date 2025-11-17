//
//  AIMessageChatView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 17/11/25.
//


import SwiftUI
import FoundationModels

struct AIMessageChatView: View {
    
    @State var loading = false
    @State var messages: [String] = []
    @State var text: String = ""
    
    var body: some View {
        VStack {
            ForEach(messages, id: \.self) { message in
                Text(message)
                    .padding()
                    .background(.white, in: .rect(cornerRadius: 20))
            }
            if loading {
                Image(systemName: "ellipsis")
                    .padding()
                    .symbolEffect(.variableColor)
            }
            Spacer()
            TextField("", text: $text)
                .onSubmit {
                    Task {
                        messages.append(text)
                        loading = true
                        let session = LanguageModelSession(model: .default)
                        let result = try await session.respond(to: text)
                        messages.append(result.content)
                        loading = false
                    }
                }
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .background {
            ContainerRelativeShape()
                .fill(.blue.gradient)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    AIMessageChatView()
        .background()
}
