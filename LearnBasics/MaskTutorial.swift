//
//  MaskTutorial.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 28/01/25.
//

import SwiftUI

struct MaskTutorial: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(OverlayView.mask(starsView))
        }
    }
    
    private var OverlayView: some View {
        GeometryReader { geometry in
            ZStack (alignment: .leading) {
                Rectangle()
                    //.foregroundColor(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach (1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)//rating >= index ? .yellow :
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskTutorial()
}

/*
 struct MaskBootcamp: View {
     
     @State var rating: Int = 0
     
     var body: some View {
         ZStack {
             starsView
                 .overlay(overlayView.mask(starsView))
         }
     }
     
     private var overlayView: some View {
         GeometryReader { geometry in
             ZStack(alignment: .leading) {
                 Rectangle()
                     //.foregroundColor(.yellow)
                     .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                     .frame(width: CGFloat(rating) / 5 * geometry.size.width)
             }
         }
         .allowsHitTesting(false)
     }
     
     private var starsView: some View {
         HStack {
             ForEach(1..<6) { index in
                 Image(systemName: "star.fill")
                     .font(.largeTitle)
                     .foregroundColor(Color.gray)
                     .onTapGesture {
                         withAnimation(.easeInOut) {
                             rating = index
                         }
                     }
             }
         }
     }
 }
 */
