//
//  ScrollViewLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 21/01/25.
//

import SwiftUI

struct ScrollViewLern: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                Button("Click to got to # Index : 30") {
                    withAnimation(.spring()) {
                        proxy.scrollTo(30, anchor: .center)
                    }
                }
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
                
            }
        }
    }
}

#Preview {
    ScrollViewLern()
}
