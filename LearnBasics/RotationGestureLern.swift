//
//  RotationGestureLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 11/01/25.
//

import SwiftUI

struct RotationGestureLern: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Rotate Me..!")
            .font(.title)
            .fontWeight(.bold)
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(15.0)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { rotDeg in
                        angle = rotDeg
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureLern()
}
