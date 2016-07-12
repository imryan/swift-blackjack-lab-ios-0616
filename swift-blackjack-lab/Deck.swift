//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Ryan Cohen on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {

    private var remainingCards: [Card] = []
    private var dealtCards: [Card] = []
    
    init() {
        generateDeck()
    }
    
    func drawCard() -> Card {
        let card = remainingCards[0]
        
        dealtCards.append(card)
        remainingCards.removeFirst()
        
        return card
    }
    
    func shuffle() {
        let shuffledCards: [Card] = remainingCards
        remainingCards.removeAll()
        
        while (shuffledCards.count != 0) {
            let card = randomCardFromDeck(shuffledCards)
            remainingCards.append(card)
        }
    }
    
    private func generateRandomCard() -> Card {
        let suitIndex = Int(arc4random_uniform(UInt32(Card.validSuits().count)))
        let rankIndex = Int(arc4random_uniform(UInt32(Card.validRanks().count)))
        
        let suit = Card.validSuits()[suitIndex]
        let rank = Card.validRanks()[rankIndex]
        
        return Card.init(suit: suit, rank: rank)
    }
    
    private func cardIsGenuine(card: Card) -> Bool {
        var genuine = true
        
        for aCard: Card in self.remainingCards {
            if (aCard.cardLabel == card.cardLabel) {
                genuine = false
            }
        }
        
        return genuine
    }
    
    private func generateDeck() {
        for _ in 1...51 {
            var card: Card = generateRandomCard()
            
            while (!cardIsGenuine(card)) {
                card = generateRandomCard()
            }
            
            if (cardIsGenuine(card)) {
                remainingCards.append(card)
            }
        }
        
        remainingCards.insert(Card.init(suit: "♣︎", rank: "K"), atIndex: 0)
    }
    
    private func randomCardFromDeck(deck: [Card]) -> Card {
        let index = Int(arc4random_uniform(UInt32(deck.count)))
        return deck[index]
    }
    
    var description : String {
        return "Cards Remaining: \(remainingCards.count) \nCards Dealt: \(dealtCards.count)"
    }
}