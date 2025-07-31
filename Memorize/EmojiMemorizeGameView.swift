//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/12.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame

    private let aspectRactio:CGFloat = 2/3
    
    var body: some View {
        VStack(alignment: .center) {
            cards
                .foregroundColor(.orange)
                .padding()
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        GeometryReader { gmreader in
            let gridItemWidth = gridItemWidthThatFits(count: viewModel.cards.count, size: gmreader.size, atAspectRatio: aspectRactio)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemWidth), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(aspectRactio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                        .animation(.spring(duration: 1), value: card.isFaceUp)
                        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
                    
                }
            }
        }
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio:CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let rowCount = (count / columnCount).rounded(.up)
            let columnWidth = size.width / columnCount
            let columnHeight = columnWidth / aspectRatio
            if columnHeight * rowCount < size.height {
                return columnWidth
            }
            columnCount += 1
        } while columnCount < count
        return min(size.width/columnCount, size.height*aspectRatio)
    }
}
    
struct CardView: View, Animatable {
    let card: MemorizeGame<String>.Card
    @State private var isSpinning = false

    init(card: MemorizeGame<String>.Card) {
        self.card = card
        animatableData = card.isFaceUp ? 0 : 180
    }
    
    var threshold: Bool {
        animatableData < 90
    }
    
    var animatableData: Double
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                ZStack {
                    base.foregroundColor(threshold ? .white : .orange)
                    base.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.1)
                        .aspectRatio(1, contentMode: .fit)
                        .opacity(threshold ? 1 : 0)
                        .rotationEffect(.degrees(isSpinning ? 360 : 0))
                        .animation(.linear(duration: 1).repeatCount(5, autoreverses: false), value: isSpinning)
                }
            } else {
                base.fill()
                    .opacity(threshold ? 0 : 1)
            }
        }
        .rotation3DEffect(.degrees(animatableData), axis: (0,1,0))
                .onChange(of: card.isMatched) { oldValue, newValue in
                    if newValue {
                        isSpinning = true
                    }
                }
    }
}

#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
