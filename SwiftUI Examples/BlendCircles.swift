//
//  BlendCircles.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 11/12/25.
//
import SwiftUI

struct BlendCircles: View {
    
    @State private var filter: BlendMode = .normal

    private let allModes: [BlendMode] = [
        .normal, .multiply, .screen, .overlay,
        .darken, .lighten, .colorDodge, .colorBurn,
        .softLight, .hardLight, .difference, .exclusion,
        .hue, .saturation, .color, .luminosity,
        .plusDarker, .plusLighter
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .offset(x: -15, y: -15)

                Circle()
                    .fill(.blue)
                    .blendMode(filter)
                    .offset(x: 15, y: 15)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu("Filter") {
                        ForEach(allModes, id: \.self) { mode in
                            Button(modeName(mode).capitalized) {
                                filter = mode
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Nome legível para o menu
    func modeName(_ mode: BlendMode) -> String {
        String(describing: mode)
            .replacingOccurrences(of: "SwiftUI.BlendMode.", with: "")
    }
}


#Preview {
    BlendCircles()
}
