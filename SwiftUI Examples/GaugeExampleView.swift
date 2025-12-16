//
//  GaugeExampleView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 16/12/25.
//

import SwiftUI

struct GaugeExampleView: View {
    @State var speed = 50.0
    
    var body: some View {
        VStack {
            Gauge(value: speed, in: 0 ... 160) {
                Text(
                    Measurement(value: speed, unit: UnitSpeed(forLocale: Locale.current)),
                    format: .measurement(width: .abbreviated)
                )
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .contentTransition(.identity)
            }
            .gaugeStyle(SpeedometerGaugeStyle())
            
            HStack {
                Group {
                    Button("Brake", systemImage: "chevron.backward.2") {
                        speed -= 1
                    }
                    Button("Accelerate", systemImage: "chevron.forward.2") {
                        speed += 1
                    }
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .buttonRepeatBehavior(.enabled)
                .tint(.gray)
            }
        }
        .fontDesign(.monospaced)
        .animation(.default, value: speed)
        .background(.black.gradient)
    }
    
}

#Preview {
    GaugeExampleView()
}

struct SpeedometerGaugeStyle: GaugeStyle {
    func makeBody(configuration: Configuration) -> some View {
        let gradient = LinearGradient(colors: [.red, .yellow, .green], startPoint: .leading, endPoint: .trailing)
        ZStack {
            ArcShape()
                .stroke(gradient,
                        style: StrokeStyle(lineWidth: 50, lineCap: .round))
                .opacity(0.2)
                .blendMode(.colorDodge)
            ArcShape()
                .trim(from: 0, to: configuration.value)
                .stroke(gradient.shadow(.inner(radius: 3)),
                        style: StrokeStyle(lineWidth: 50, lineCap: .round)
                )
                .shadow(color: .red, radius: 10)
            ArcShape()
                .stroke(style: StrokeStyle(lineWidth: 12, dash: [1, 50]))
            configuration.label
        }
    }
}


struct ArcShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: 140,
            startAngle: .degrees(150),
            endAngle: .degrees(30),
            clockwise: false
        )
        return path
    }
}
