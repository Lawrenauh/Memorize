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
    @State var isFacedup = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            if isFacedup {
                ZStack {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 5)
                    Text("👻").font(.largeTitle)
                }
            } else {
                base.fill()
            }
        }
        .onTapGesture(count: 1) {
            isFacedup.toggle()
        }
    }
    

}

#Preview {
    ContentView()
}
