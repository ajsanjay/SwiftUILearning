//
//  DragGestureLernAdvancd.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 16/01/25.
//

import SwiftUI

struct DragGestureLernAdvancd: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.size.height * 0.83
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            SighnUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { newVal in
                            withAnimation(.spring()) {
                                currentDragOffsetY = newVal.translation.height
                            }
                        }
                        .onEnded { newVal in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
            Text("\(currentDragOffsetY)")
        }
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DragGestureLernAdvancd()
}

struct SighnUpView: View {
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sighn Up")
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Text("lsdnf iwebfuwew webro8weur aefbbf sadufysdfa sfasofysdbf ijasndjhsa sauyfbsdh f sdf sd f sdufbas fusdbfh sdfuhsdf oisdf")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10.0))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(60.0)
    }
}
