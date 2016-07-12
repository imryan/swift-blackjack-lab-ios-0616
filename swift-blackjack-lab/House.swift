//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    override init(name: String) {
        super.init(name: name)
        tokens = 1000
    }
    
    var mustHit: Bool {
        var hit = true
        
        if (handscore == 17) {
            stayed = true
            hit = false
        }
        
        return hit
    }
}