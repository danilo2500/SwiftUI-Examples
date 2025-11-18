//
//  PathView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 17/11/25.
//



import SwiftUI

struct PathView: View {
    
    @State var animate = 1
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: .init(x: 100, y: 800))
                path.addCurve(
                    to: .init(x: 300, y: 0),
                    control1: .init(x: 100, y: 600),
                    control2: .init(x: 300, y: 200)
                )
            }
            .stroke(.green, lineWidth: 5)
            .shadow(color: .green, radius: 5)
            
            Path { path in
                path.move(to: .init(x: 300, y: 800))
                path.addCurve(
                    to: .init(x: 100, y: 0),
                    control1: .init(x: 300, y: 600),
                    control2: .init(x: 100, y: 200)
                )
            }
            .stroke(.blue, lineWidth: 5)
            .shadow(color: .blue, radius: 5)
            
            ForEach(Array(stride(from: 0, through: 600, by: 100)), id: \.self) { x in
                ForEach(Array(stride(from: 0, through: 800, by: 100)), id: \.self) { y in
                    Text("\(x),\(y)")
                        .position(x: CGFloat(x), y: CGFloat(y))
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    PathView()
}
