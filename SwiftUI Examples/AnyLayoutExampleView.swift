//
//  AnyLayoutExampleView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 18/12/25.
//

import SwiftUI

struct AnyLayoutExampleView: View {
    
    @State var isOpen = false
    
    var body: some View {
        
        let layout = isOpen ?
        AnyLayout(HStackLayout()) : AnyLayout(ZStackLayout())
        
        VStack {
            Button("More", systemImage: "square.and.arrow.up") {
                isOpen.toggle()
            }
            .symbolEffect(.scale.up, isActive: isOpen)
            layout {
                Group {
                    Button("Mail", systemImage: "mail") {
                        
                    }
                    Button("Phone", systemImage: "phone") {
                        
                    }
                    Button("Copy", systemImage: "square.on.square") {
                        
                    }
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                
            }
        }
        .font(.title2)
        .tint(.black)
        .animation(.spring, value: isOpen)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.gradient)
    }
}

#Preview {
    AnyLayoutExampleView()
}
