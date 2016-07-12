# Swift — Blackjack

## Objectives

1. Create custom data models in Swift:
  * Declare properties.
  * Write initializers.
  * Write methods.
2. Declare properties as readonly or private.
3. Write and utilize private methods.
4. Write a custom setter.
5. Use calculated properties.
6. Subclass in Swift:
  * Override the superclass's initializer.
  * Extend the class.
7. Combine the usage of your classes to assemble a working back-end.

## Introduction

#### Twenty-One

[Blackjack](https://en.wikipedia.org/wiki/Blackjack), also known as "twenty-one", is a casino card game in which a player attempts to build a hand that is closer to a score of 21 than the house (or dealer's) hand without going over a total of 21 (or "busting"). The Ace's base value is one (1), but can be used as a value of eleven (11) if doing so does not bust a hand. Players are initially dealt two cards and choose to be dealt additional cards (to "hit") or to hold their hand until the end of the round (to "stay").

## Instructions

Open `swift-blackjack.xcworkspace`. 

You may deselect the target membership of the testing files in order to work on the classes-one-by-one, reenabling each class's test file as you go along. This option is found in the File Inspector pane of the Utilities area when the relevant file is selected in the Project Navigator pane of the Navigator area.  
**Note:** *Doing this may report false-positives to your Learn.co profile's local build light, so make sure you have test results for all five custom classes before regarding your solution as complete.*

### `Card.swift`

1. Create a `Card` class. It will need the following properties:
  * `suit`, a string,
  * `rank`, a string,
  * `cardLabel`, a string, and
  * `cardValue`, an unsigned integer.

2. Write an initializer for `Card` that takes two arguments for `suit` and `rank`.
  * It should also set the `cardLabel` property to string containing both the suit and the rank in the form of `♠︎A` (for the Ace of Spades).
  * It should also set the `cardValue` property appropriately for scoring Blackjack: Aces are worth one, number cards are worth their face values, and face cards are worth ten.

3. Set up two class methods called `validSuits` and `validRanks` that return arrays containing the four suit icons and the thirteen string representations of the ranks (Ace through King).

### `Deck.swift`

1. Create a `Deck` class. It should have two private array properties for holding cards: one for holding the remaining (undealt) cards, and the other for holding the dealt cards. The test file cannot see them so name them yourself.

2. Write an initializer that generates the 52 unique cards required for modeling a standard 52-card deck. It should hold them in the array of cards that can be dealt.

3. Add a `description` string property that can be used to print information regarding the cards to the console. This string will need to contain information about the remaining cards and dealt cards.  
**Top-tip:** *Set this up as a calculated property that calls a private method which returns a string.*

4. Write a `drawCard()` function to return the next card. It should remove that card from the remaining cards and add it to the dealt cards.

5. Write a `shuffle()` method that gathers up the dealt cards and randomizes all 52 cards.  
**Hint:** *The* `arc4random_uniform()` *C function is accessible in Swift also.*


### `Player.swift`

1. Create a `Player` class. It will need nine properties total:
  * `name`, a string,
  * `cards`, an array of `Card` objects,
  * `handscore`, an unsigned integer,
  * `blackjack`, a boolean,
  * `busted`, a boolean,
  * `stayed`, a boolean,
  * `mayHit`, a boolean,
  * `tokens`, an unsigned integer, and
  * `description`, a string.

2. Write an initializer which takes an argument for the `name` property. Make the initial value of the `tokens` property `100`.

3. Make `description` a calculated property which returns a string detailing the object's current state.

4. Make `handscore` a calculated property that evaluates the `cards` array. It may use one Ace as a value of 11 if doing so will not bust the hand.  
**Hint:** *You can have a calculated property call a private method to keep the property declaration section clean.*

5. Make `blackjack` a calculated property that determines whether the hand is a blackjack (a score of 21 with only two cards).

6. Make `busted` a calculated property that determines whether the hand is busted (over score of 21).

7. Leave the `stayed` property initialized to `false`. It will need to be used to hold state during a round.

8. Make `mayHit` a calculated property that determines whether the player may take a new card (if the hand is not busted, is not a blackjack, and if the player has not stayed).

9. Write a method called `canPlaceBet()` which takes an unsigned integer argument and returns a boolean of whether or not the player can afford the submitted bet.

10. Write two methods called `didWin()` and `didLose()` which both take an unsigned integer for the value of the bet and appropriately update the value of `tokens`.

### `House.swift`

1. Create a `House` class. It should be a subclass of the `Player` class.

2. Override the superclass's initializer to set the `tokens` property to `1000`.

3. Add a calculated property `mustHit` that returns a boolean of whether the house must take a new card or not. Treat the "house rules" as staying at a score of seventeen (17).

### `Dealer.swift`

1. Create a `Dealer` class. It should have four properties:
  * a `Deck` called `deck`,
  * a `House` called `house` and named "House",
  * a ***`House`*** called `player` and named "Player", and
  * an unsigned integer called `bet` which starts at zero.  
**Note:** *In this console-version of the game, since we don't have a user interface for providing input, we're going to use the `House` class's `mustHit` method for the player's decision-making also.*

3. Write a method called `placeBet()` which takes an unsigned integer argument and returns a boolean of whether or not the house and the player can both afford the submitted bet. If they can, this method should record the value of the bet being placed.

4. Write a method called `deal()` that deals a new round, giving two new cards each to the player and to the house.

5. Write a method called `turn()` which takes a `House` argument (*since in this console version both the house and the player will be used with this method*). If the `House` object is allowed to take a card, it should be asked if it wishes to hit or stay. If the `House` object wishes to hit, the dealer should then give it a card. If the `House` object wishes to stay, then the decision to stay should be recorded.

6. Write a method called `winner()` which returns a string containing the result of the round. It should:
  * return `"player"` if the player wins,
  * return `"house"` if the house wins, and
  * return `"no"` if there is not yet a winner.  
  Keep in mind that:
      * a bust is an immediate victory for the other player,
      * the house wins ties, and
      * the player can win by holding five cards that are not a bust.

7. Write a method called `award()` that uses the result of the `winner()` method to award the bet to the winner of the round. It should add the value of the bet to the winning player and subtract the value of the bet from the losing player. The `award()` method should also return a string message expressing the result of the round in a phrase or sentence.  
**Top-tip:** *Swift's* `switch` *statement works with objects—in contrast to Objective-C's which only works with integers and enums.*

### `AppDelegate.swift`

1. In `AppDelegate.swift`, add a `Dealer` property called `dealer`.

2. Write a method called `playBlackjack()` that calls the different steps in the game in order. The player and house should be offered a maximum of five cards total.

3. Add `print()` statements utilizing the `description` properties that you wrote in order to build a readout of the game as it progresses.

## Advanced

1. Add functionality to handle a "push", the case in which both the house and the player are dealt blackjack hands. A "push" is handled like a "tie", with the player's original bet being returned without modification.

2. Create another subclass of `Player` called `Shark`. Give it a method called `willHit()` that returns a boolean of whether the best strategy is to hit (true) or stay (false) according to a [Blackjack strategy card](https://blackjack.press/wp-content/uploads/2014/12/advanced-blackjack-strategy-bj-press.jpg). 
  * (Easy) Make a decision based upon whether the current hand score is soft (contains an Ace) or hard (without an Ace). 
  * (Hard) Make a decision **also** based upon the "visible" cards currently in the House's hand (remember that the house's first card is dealt face-down and only revealed at the end of the round).

3. Add functionality to give a player the option to "double down" on the bet.
  * If you wrote the `Shark` class, add behavior to the class's decision-making that accounts for this aspect of Blackjack strategy.
