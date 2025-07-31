//
//  CardView.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/27.
//

import SwiftUI

struct CardViewTest: View {
    
    var body: some View {
        GeometryReader { fullGeometry in
                VStack(spacing: 0) {
                    Spacer()
                    Circle()
                        .frame(width: fullGeometry.size.width/2)
                        .overlay(
                            Image(systemName: "pawprint")
                                .foregroundColor(.white)
                                .scaleEffect(2)
                        )
                    
                    Spacer()
                    Text("Hi, Lawrence! How can I help you?")
                        .padding()
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .lineLimit(5)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: fullGeometry.size.width*0.9, maxHeight: fullGeometry.size.height*0.4, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                        )
//                        .cornerRadius(0.5)
//                        .border(Color(white: 0.9))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 0.6) // .stroke 用于创建描边
                        )
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(.green)
            }
        }
    
}


#Preview {
    CardViewTest()
}
