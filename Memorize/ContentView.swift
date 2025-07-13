//
//  ContentView.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/12.
//

import SwiftUI

struct ContentView: View {
    @State var Counter = 5
    var EmojiList = ["👻", "🦋", "🙈", "🤡", "👻", "🦋", "🙈", "🤡", "🤖", "😺", "🎃"]
    
    var body: some View {
        VStack {
            cards
            cardsCountAjuster
        }
         .foregroundColor(.orange)
         .padding()
   }
    
    var cards: some View {
        VStack {
            ForEach(0..<Counter, id: \.self ) { i in
                CardView(content: EmojiList[i])
            }
        }
    }
    
    var cardsCountAjuster: some View {
        HStack {
            cardsCountAjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardsCountAjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
        }
    }
    
    func cardsCountAjuster(by offset: Int, symbol: String) -> some View {
        Button {
            Counter += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(Counter + offset < 1 || Counter + offset > EmojiList.count)
        .padding()
        .imageScale(.large)
        .font(.title3)
    }
}

struct CardView: View {
    
    @State var isFacedup = false
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            if isFacedup {
                ZStack {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 5)
                    Text(content)
                        .font(.largeTitle)
                        .frame(width: 40, height: 40)
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
