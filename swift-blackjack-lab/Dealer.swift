//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    
    var deck: Deck
    var house: House!
    var player: House!
    var bet: UInt = 0
    
    init() {
        house = House.init(name: "House")
        player = House.init(name: "Player")
        
        deck = Deck.init()
    }
    
    func placeBet(bet: UInt) -> Bool {
        if (house.canPlaceBet(bet) && player.canPlaceBet(bet)) {
            self.bet = bet
            return true
        }
        
        return false
    }
    
    func deal() {
        if (player.cards.count != 0 && house.cards.count != 0) {
            player.cards.removeAll()
            house.cards.removeAll()
        }
        
        for _ in 1...2 {
            player.cards.append(deck.drawCard())
            house.cards.append(deck.drawCard())
        }
        
        player.stayed = false
        house.stayed = false
    }
    
    func turn(player: House) {
        if (player.canPlaceBet(bet) && player.mayHit) {
            if (player.mustHit) {
                player.cards.append(deck.drawCard())
            }
        }
    }
    
    func winner() -> String {
        var winner = "None"
        
        if (player.busted || house.blackjack) || (player.handscore > house.handscore && player.stayed && house.stayed) || (player.cards.count == 5 && !player.busted) {
            winner = "Player"
        }
            
        else if (player.busted || house.blackjack) || (player.handscore <= house.handscore && player.stayed && house.stayed) {
            winner = "House"
        }
        
        return winner
    }
    
    func award() -> String {
        if (winner() == "Player") {
            player.didWin(bet)
            house.didLose(bet)
        } else if (winner() == "House") {
            player.didLose(bet)
            house.didWin(bet)
        } else {
            return "No winner"
        }
        
        return "\(winner()) wins!"
    }
}