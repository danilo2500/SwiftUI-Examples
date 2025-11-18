//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 15/11/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Gradients") {
                    GradientExamplesView()
                }
                NavigationLink("Scrollable Video") {
                    ScrollableVideoView()
                }
                NavigationLink("ListEditView") {
                    ListEditView()
                }
                NavigationLink("AIMessageChatView") {
                    AIMessageChatView()
                }
                NavigationLink("path") {
                    PathView()
                }
            }
            .navigationTitle("SwiftUI Examples")
        }
    }
}

#Preview {
    MainView()
}
