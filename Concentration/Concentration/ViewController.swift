//
//  ViewController.swift
//  Concentration
//
//  Created by Christopher Patti on 12/16/17.
//  Copyright © 2017 Christopher Patti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func NewGameButton(_ sender: UIButton) {
        print("game.initialNumberOfPairsOfCards=\(game.initialNumberOfPairsOfCards)")
        emojiChoices = ["👻","🎃","🦈","🐔","🦐","🙈","😈","🐼","🐂"]
        game.newGame(numberOfPairsOfCards: game.initialNumberOfPairsOfCards)
        updateViewFromModel()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber)")
        } else {
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            print("Updating card: \(card)")
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }

    // var emojiChoices = [String]()
    var emojiChoices = ["👻","🎃","🦈","🐔","🦐","🙈","😈","🐼","🐂"]

    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            print("randomIndex = \(randomIndex)")
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        print("card = \(card)")
        print("emoji = \(emoji)")
        print("emoji[card.identifier] = \(emoji[card.identifier]!)")
        return emoji[card.identifier] ?? "?"
    }
}




