	//
//  Concentration.swift
//  Concentration
//
//  Created by Christopher Patti on 12/18/17.
//  Copyright © 2017 Christopher Patti. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    func newGame(numberOfPairsOfCards: Int) {
        let totalCards = numberOfPairsOfCards * 2
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // Create two fresh new cards. Copy!
            cards += [card, card]
        }
        
        var tempCard: Card
        for cardIndex in 0..<totalCards {
            // Swap the current card with a random card from the deck
            let swapWith = Int(arc4random_uniform(UInt32(totalCards)))
            print("swapWith = \(swapWith)")
            tempCard = cards[cardIndex]
            cards[cardIndex] = cards[swapWith]
            cards[swapWith] = tempCard
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        newGame(numberOfPairsOfCards: numberOfPairsOfCards)
    }
}
