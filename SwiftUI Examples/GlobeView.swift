//
//  PathView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 17/11/25.
//



import SwiftUI

struct GlobeView: View {
    
    @State var animate = false
    
    var body: some View {
        HStack(spacing: 10) {
            Button("", systemImage: "heart") {
                animate.toggle()
            }
            .rotation3DEffect(
                .degrees(animate ? 160 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.spring, value: animate)
        }
    }
}

#Preview {
    GlobeView()
}
