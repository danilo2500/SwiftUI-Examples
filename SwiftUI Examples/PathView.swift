//
//  PathView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 17/11/25.
//



import SwiftUI

struct PathView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: .init(x: 100, y: 500))
                path.addCurve(
                    to: .init(x: 300, y: 500),
                    control1: .init(x: 100, y: 700),
                    control2: .init(x: 300, y: 300)
                )
            }
            .stroke(lineWidth: 5)
            
            ForEach(Array(stride(from: 0, through: 600, by: 100)), id: \.self) { x in
                ForEach(Array(stride(from: 0, through: 800, by: 100)), id: \.self) { y in
                    Text("\(x),\(y)")
                        .position(x: CGFloat(x), y: CGFloat(y))
                        .bold()
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    PathView()
}
