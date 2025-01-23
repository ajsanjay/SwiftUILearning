//
//  GeometryInAdvancedLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 23/01/25.
//

import SwiftUI

struct GeometryInAdvancedLern: View {
    
    func getPercentageOfX(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.size.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20.0)
                            .rotation3DEffect(
                                Angle(degrees: getPercentageOfX(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 250, height: 200)
                    .padding()
                }
            }
        })
    }
}

#Preview {
    GeometryInAdvancedLern()
}
