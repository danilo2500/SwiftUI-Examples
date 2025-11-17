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

import SwiftUI

struct PathView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: .init(x: 50, y: 50))
                path.addLine(to: .init(x: 100, y: 100))
                path.addLine(to: .init(x: 200, y: 0))
            }
            .stroke(lineWidth: 10)
            
            ForEach(Array(stride(from: 0, through: 200, by: 50)), id: \.self) { x in
                ForEach(Array(stride(from: 0, through: 200, by: 50)), id: \.self) { y in
                    Text("\(x),\(y)")
                        .position(x: CGFloat(x), y: CGFloat(y))
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.red)
                }
            }
        }
        .padding()
    }
    
    
    struct Arc: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: .zero)
            path.addLines([
                CGPoint(x: 0, y: 0),
                CGPoint(x: 100, y: 100),
                CGPoint(x: 300, y: -100)
            ])
            return path
        }
    }
}



#Preview {
    PathView()
}

#Preview {
    MainView()
}
