//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Ryan Cohen on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit: String!
    var rank: String!
    var cardLabel: String!
    var cardValue: UInt = 0
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        
        cardLabel = "\(suit)\(rank)"
        
        switch (rank) {
            case "A":
                cardValue = 1
            case "J", "Q", "K":
                cardValue = 10
            default:
                cardValue = UInt(rank)!
                break
        }
    }
    
    class func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    class func validRanks() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    var description: String {
        return cardLabel
    }
}