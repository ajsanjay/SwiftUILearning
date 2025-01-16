//
//  DreagGestureLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 11/01/25.
//

import SwiftUI

struct DreagGestureLern: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        Text("Drag Me")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(40)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(15.0)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { drag in
                        withAnimation() {
                            offset = drag.translation
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    DreagGestureLern()
}
