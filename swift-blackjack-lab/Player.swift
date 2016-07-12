//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    
    var name: String!
    var cards: [Card] = []
    
    var stayed: Bool = false
    var tokens: UInt = 0
    
    init(name: String) {
        self.name = name
        tokens = 100
    }
    
    var blackjack: Bool {
        return (cards.count == 2 && handscore == 21)
    }
    
    var busted: Bool {
        return (handscore > 21)
    }
    
    var mayHit: Bool {
        return (!busted && !blackjack && !stayed)
    }
    
    var handscore: UInt {
        var score: UInt = 0
        var hasAce = false
        
        for card: Card in cards {
            if (card.cardLabel.containsString("A")) {
                hasAce = true
            }
            
            score += card.cardValue
        }
        
        if (hasAce) {
            if (!(score + 10 > 21)) {
                score += 10
            }
        }
        
        print("\n\nScore: \(score)")
        
        return score
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return (tokens >= bet)
    }
    
    func didWin(bet: UInt) {
        tokens += bet
    }
    
    func didLose(bet: UInt) {
        tokens -= bet
    }
    
    var description: String {
        var cardsDescription: String = ""
        
        for card: Card in cards {
            cardsDescription = cardsDescription.stringByAppendingString("\n[\(card.cardLabel)]")
        }
        
        cardsDescription = cardsDescription.stringByAppendingString("\nPlayer: \(name)\nHandscore: \(handscore)\nTokens: \(tokens)\nCards: \(cardsDescription)\nBlackjack: \(blackjack)\nBusted: \(busted)\nStayed: \(stayed)")
        
        return cardsDescription
    }
}