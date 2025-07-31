//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lawrence Hu on 2025/7/13.
//

import Foundation

struct MemorizeGame<cardContent: Equatable> {
    var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> cardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:"\(pairIndex)a", content: content))
            cards.append(Card(id: "\(pairIndex)b", content: content))
        }
    }
    
    var indexOfTheOnlyOneFaceUpCard: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp }.only }
        set { cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card){
        if let chooseIndex = cards.IndexOfId(id: card.id) {
            if !cards[chooseIndex].isFaceUp && !cards[chooseIndex].isMatched {
                if let protentialMatchIndex = indexOfTheOnlyOneFaceUpCard {
                    if cards[chooseIndex].content == cards[protentialMatchIndex].content {
                        cards[chooseIndex].isMatched = true
                        cards[protentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOnlyOneFaceUpCard = chooseIndex
                }
                cards[chooseIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
    }
    
    struct Card: Identifiable, Equatable {
        var id: String
        var isFaceUp = false
        var isMatched = false
        var content: cardContent
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
    
extension Array where Element: Identifiable {
    func IndexOfId(id: Element.ID) -> Int? {
        firstIndex(where: {$0.id == id})
    }
}
