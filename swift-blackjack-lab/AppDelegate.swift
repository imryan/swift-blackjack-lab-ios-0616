//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        playBlackjack()
        
        return true
    }
    
    func playBlackjack() {
        let dealer = Dealer()
        dealer.deal()
        
        for _ in 1...3 {
            dealer.turn(dealer.player)
            dealer.turn(dealer.house)
            
            dealer.turn(dealer.player)
            dealer.turn(dealer.house)
            
            if (dealer.player.busted || dealer.house.busted) {
                break
            }
        }
        
        print(dealer.player.description)
        print(dealer.house.description)
        
        print(dealer.award())
    }
}
