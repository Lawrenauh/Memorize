//
//  ContentView.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/12.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 5
    var EmojiList = ["👻", "🦋", "🙈", "🤡", "👻", "🦋", "🙈", "🤡", "🤖", "😺", "🎃"]
    
    var body: some View {
        VStack {
            VStack {
                ForEach(0..<counter, id: \.self ) { i in
                    CardView(content: EmojiList[i])
                }
            }
            .foregroundColor(.orange)
            .padding()
            
            HStack {
                CardRemover()
                    .onTapGesture {
                        if counter > 1 {
                            counter -= 1
                        }
                }
                Spacer()
                CardAdder()
                    .onTapGesture {
                        if counter < EmojiList.count {
                        counter += 1
                    }
                }
            }
            .padding()
            .foregroundColor(.orange)
            .imageScale(.large)
            .font(.title2)
        }
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

struct CardAdder: View {
    
    var body: some View {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        }

}

struct CardRemover: View {
    var body: some View {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        }
}


#Preview {
    ContentView()
}
