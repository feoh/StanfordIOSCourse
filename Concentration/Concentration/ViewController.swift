//
//  ViewController.swift
//  Concentration
//
//  Created by Christopher Patti on 12/16/17.
//  Copyright © 2017 Christopher Patti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print("cardNumber = \(cardNumber)")
        } else {
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on Button: UIButton) {
        if Button.currentTitle == emoji {
            Button.setTitle("", for: UIControlState.normal)
            Button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            Button.setTitle(emoji, for: UIControlState.normal)
            Button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}



