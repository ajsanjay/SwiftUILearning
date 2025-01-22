//
//  GeometryLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 22/01/25.
//

import SwiftUI

// UIScreen.main.bounds Will not work on rotate device for this purpose we mainly use GeometryReader
// GeometryReader consumes lot memory so use this only incase we find no other alternative option
struct GeometryLern: View {
    var body: some View {
        GeometryReader { geometry in
            /*HStack (spacing: 0) {
                Rectangle()
                    .fill(.red)
                    .frame(width: UIScreen.main.bounds.size.width * 0.7)
                Rectangle()
                    .fill(.green)
            }
            .ignoresSafeArea()
            */
            HStack (spacing: 0) {
                Rectangle()
                    .fill(.red)
                    .frame(width: geometry.size.width * 0.7)
                Rectangle()
                    .fill(.green)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GeometryLern()
}
