//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 15/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Gradients") {
                    GradientExamplesView()
                }
            }
            .navigationTitle("SwiftUI Examples")
        }
    }
}

struct GradientExamplesView: View {
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: 3)
        LazyVGrid(columns: columns) {
            Group {
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    RadialGradient(
                        colors: [.red, .yellow, .cyan],
                        center: .center,
                        startRadius: 0,
                        endRadius: 160
                    )
            
                    AngularGradient(
                        colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                        center: .center
                    )
            
                    AngularGradient(
                        colors: [.black, .white],
                        center: .top
                    )
                LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom)
                    .mask(
                        Image(systemName: "star.fill")
                            .resizable()
                    )
            }
            .frame(width: 100, height: 100)
        }
        .navigationTitle("Gradients")
    }
}
#Preview {
    GradientExamplesView()
}


#Preview {
    ContentView()
}
