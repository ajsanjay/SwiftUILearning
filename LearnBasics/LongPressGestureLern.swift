//
//  LongPressGestureClass.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 10/01/25.
//

import SwiftUI

struct LongPressGestureLern: View {
    
    @State var isComplete: Bool = false
    @State var isSucess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSucess ? .green : .yellow)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.mint)
            HStack {
                Text("Start")
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
                    .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 100) { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                if !isSucess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSucess = true
                        }
                    }
                Text("Reset")
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
                    .onTapGesture {
                        isComplete = false
                        isSucess = false
                    }
            }
        }
        
        Text(isComplete ? "Completed. !" : "In Progress ..")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? .green : .red)
            .foregroundColor(.white)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.heavy)
            .cornerRadius(10.0)
//            .onTapGesture {
//                isComplete.toggle()
//            }
        /* By default takes 1 second
            .onLongPressGesture {
                isComplete.toggle()
            }*/
        /* Added minimum duration 5 seconds
            .onLongPressGesture(minimumDuration: 5.0) {
                isComplete.toggle()
            }
         */
        // here on tap in text hold and drag the finger within 100 px still the long press gesture works
            .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 100) {
                isComplete.toggle()
            }
    }
}

#Preview {
    LongPressGestureLern()
}
