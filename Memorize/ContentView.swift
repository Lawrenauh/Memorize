//
//  ContentView.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFacedup: true)
            CardView(isFacedup: true)
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFacedup: Bool = false
    
    var body: some View {
        if isFacedup {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(lineWidth: 5)
                Text("👻").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 30)
        }
    }
}

#Preview {
    ContentView()
}
