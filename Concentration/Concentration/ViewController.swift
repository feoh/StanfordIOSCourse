//
//  ViewController.swift
//  Concentration
//
//  Created by Christopher Patti on 12/16/17.
//  Copyright © 2017 Christopher Patti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on Button: UIButton) {
        if Button.currentTitle == emoji {
            Button.setTitle("", for: UIControlState.normal)
            Button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            Button.setTitle("", for: UIControlState.normal)
            Button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}



