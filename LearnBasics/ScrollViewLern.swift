//
//  ScrollViewLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 21/01/25.
//

import SwiftUI

struct ScrollViewLern: View {
    
    @State var scrollIndex: Int = 0
    @State var blockNum: String = ""
    
    var body: some View {
        VStack {
            TextField("Input a block # No: Here ..", text: $blockNum)
                .frame(height: 55)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(.red, lineWidth: 2)
                )
                .padding(.horizontal)
            
            Button("Go to Block") {
                if let index = Int(blockNum) {
                    scrollIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
//                    Button("Click to got to # Index : 30") {
//                        withAnimation(.spring()) {
//                            proxy.scrollTo(30, anchor: .center)
//                        }
//                    }
                    ForEach(0..<50) { index in
                        Text("Object at # Index : \(index)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(height: 150)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(15.0)
                            .shadow(radius: 15.0)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollIndex, {
                        proxy.scrollTo(scrollIndex, anchor: .bottom)
                    })
                }
            }
        }
    }
}

#Preview {
    ScrollViewLern()
}
