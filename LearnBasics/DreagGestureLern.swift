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
        ZStack {
            VStack {
                Text("\(offset.width)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(20)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(15.0)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotateAmount()))
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
//        Text("Drag Me")
//            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//            .padding(40)
//            .background(.green)
//            .foregroundColor(.white)
//            .cornerRadius(15.0)
//            .offset(offset)
//            .gesture(
//                DragGesture()
//                    .onChanged { drag in
//                        withAnimation() {
//                            offset = drag.translation
//                        }
//                    }
//                    .onEnded { _ in
//                        withAnimation(.spring()) {
//                            offset = .zero
//                        }
//                    }
//            )
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.size.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5)
    }
    
    func getRotateAmount() -> Double {
        let max = UIScreen.main.bounds.size.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
    
}

#Preview {
    DreagGestureLern()
}
