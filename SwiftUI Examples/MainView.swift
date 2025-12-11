//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 15/11/25.
//

import SwiftUI
internal import Combine

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
                NavigationLink("3d globe") {
                    GlobeView()
                }
                NavigationLink("BlendCircles") {
                    BlendCircles()
                }
            }
            .navigationTitle("SwiftUI Examples")
        }
    }
}

#Preview {
    MainView()
}
