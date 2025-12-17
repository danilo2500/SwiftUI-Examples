//
//  GaugeExampleView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 16/12/25.
//

import SwiftUI

struct GaugeExampleView: View {
    @State var speed = 90.0
    
    var body: some View {
        VStack {
            Gauge(value: speed, in: 0 ... 160) {
                Text(
                    Measurement(value: speed, unit: UnitSpeed(forLocale: Locale.current)),
                    format: .measurement(width: .abbreviated)
                )
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
                .font(.title)
            }
        }
        .font(.largeTitle.bold())
        .foregroundColor(.white)
        .fontDesign(.monospaced)
        .animation(.spring.speed(0.4), value: speed)
        .background(.black.gradient)
    }
    
}

#Preview {
    GaugeExampleView()
}

struct SpeedometerGaugeStyle: GaugeStyle {
    func makeBody(configuration: Configuration) -> some View {
        let gradient = AngularGradient(colors: [.green, .yellow, .red], center: .center, startAngle: .degrees(180), endAngle: .degrees(360))
        
        ZStack(alignment: .center) {
            ArcShape()
                .stroke(gradient,
                        style: StrokeStyle(lineWidth: 50, lineCap: .round))
                .opacity(0.2)
                .blendMode(.colorDodge)
            gradient
                .mask {
                    ArcShape()
                        .trim(from: 0, to: configuration.value)
                        .stroke(gradient.shadow(.inner(radius: 3)),
                                style: StrokeStyle(lineWidth: 50, lineCap: .round)
                        )
                        .shadow(color: .white, radius: 10)
                }
            ArcShape()
                .stroke(style: StrokeStyle(lineWidth: 12, dash: [1, 50]))
                .foregroundStyle(.black)
            Circle()
                .union(TriangleShape())
                .fill(.black)
                .stroke(.white)
                .frame(width: 30, height: 30)
                .phaseAnimator([true, false]) { content, phase in
                    content.rotationEffect(.degrees(phase ? 1 : -1), anchor: .bottom)
                }
                .rotationEffect(
                    .degrees(245 + configuration.value * 240),
                    anchor: .bottom
                )
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
struct TriangleShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.midX - 8, y: rect.midY))
        path.addLine(to: .init(x: rect.midX, y: rect.midY - 130))
        path.addLine(to: .init(x: rect.midX + 8, y: rect.midY))
        path.closeSubpath()
        return path
    }
}
