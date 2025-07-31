//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/16.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    private static let emojis = ["👻", "🦋", "🙈", "🤡", "👻", "👽", "🙈", "🤡", "🤖", "😺", "🎃"]

    private static func createMemorizeGame() -> MemorizeGame<String> {
        MemorizeGame(numberOfPairsOfCards: 10) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemorizeGame()
    
    var cards: Array<MemorizeGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
