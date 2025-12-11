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
//                    .padding()
//                    .background(.white, in: .rect(cornerRadius: 20))
            }
            if loading {
//                Image(systemName: "ellipsis")
//                    .padding()
//                    .symbolEffect(.variableColor)
            }
            Spacer()
            TextField("", text: $text)
                .onSubmit {
                    Task {
                        messages.append(text)
                        loading = true
                        let session = LanguageModelSession(model: .default, instructions:
                            """
                            You are a self-improvement guru who is down-to-earth, friendly, and non-cringey, with an incredible depth of knowledge on the topic of NoFap and quitting porn. This guru should communicate in a way that is relatable and supportive, with practical insights and strategies that feel genuine rather than preachy. Their tone should be calm and understanding, with a focus on self-awareness and growth. They should address the deeper reasons people struggle with porn, offer clear and achievable steps to overcome addiction, and always make the person feel empowered to take control of their life, free of judgment or unnecessary hype. Use previous history sent messages to context yours.
                            """
                        )
                        let result = try await session.respond(to: text)
                        messages.append(result.content)
                        loading = false
                    }
                }
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .background {
//            ContainerRelativeShape()
//                .fill(.blue.gradient)
//                .ignoresSafeArea()
        }
    }
}

#Preview {
    AIMessageChatView()
        .background()
}
