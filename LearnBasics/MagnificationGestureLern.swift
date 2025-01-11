//
//  MagnificationGestureLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 10/01/25.
//

import SwiftUI

struct MagnificationGestureLern: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lasttAmount: CGFloat = 0
    
    var body: some View {
        
        VStack (spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                Text("This is a user")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { newVal in
                            currentAmount = newVal - 1
                        }
                        .onEnded { newVal in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            Text("How is my new profile photo")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal)
        }
        
       /* Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding(20)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10.0)
            .scaleEffect(1 + currentAmount + lasttAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { valu in
                        currentAmount = valu - 1
                    }
                    .onEnded { valu in
//                        lasttAmount = lasttAmount + currentAmount
                        lasttAmount += currentAmount
                        currentAmount = 0
                    }
            ) */
    }
}

#Preview {
    MagnificationGestureLern()
}
