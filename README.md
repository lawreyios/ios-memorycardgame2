# LawreyMemoryCardSwift

![](https://puu.sh/rV8qy/55d41e6658.gif)

# Requirements
Xcode 8.0+, Swift 3.0

# Usage
You may clone this entire project and run it in Xcode.

# Purpose
This mini game was developed to bring fun and excitement to a big group of children at a big children's day party. It is played on a big LED screen with Apple TV and it has stirred up the excitement of many children. The game was also built in a Treasure Quest Theme and I am sharing this project to help developers that are in similar situations as me, needed a game, to help you save time in reinventing the wheels.

# How it works
## View
### FCGameBoardCollectionViewController

This is the main view controller that controls the game board. These are the basic configurations of the game, total time in seconds and states of the game.

```
let kMaxTimeInSeconds: Int = 120

enum GameState: NSInteger {
    case Playing
    case NotPlaying
    case GameEnd
}
```
This part is where we call the tap of every card. While the game is ongoing, check if its the first or second card, based on each type of card, we apply flip animation and card selectCard function.

```
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if currentGameState == .NotPlaying {
            currentGameState = .Playing
            startTimer()
            btnReset.setTitle("Stop", for: .normal)
        }
        if !cardManager.currentActiveChosenCardsIdx.contains(indexPath) && !cardManager.flippedCards.contains(indexPath){
            //showPopupWithStyle(.centered)
            let cell = collectionView.cellForItem(at: indexPath) as! FCGameCardCollectionViewCell
            let card = cardManager.currentActiveDeck[indexPath.row]
            if cardManager.currentActiveChosenCards.count <= 1 {
                if cardManager.currentActiveChosenCards.count == 1 {
                    if cardManager.currentActiveChosenCards[0].cardId != card.cardId {
                        cell.flipCardAnimation(indexPath: indexPath)
                        cardManager.selectCard(card: card, indexPath: indexPath)
                    }
                }else{
                    cell.flipCardAnimation(indexPath: indexPath)
                    cardManager.selectCard(card: card, indexPath: indexPath)
                }
            }
        }
    }
```
### FCGameCardCollectionViewCell
This is the Collection View Cell for every single card

## Manager
### CMCardDealerManager
This is the brain of the game. 

We set simple configurations here, MaxPair, DelayInSeconds after each card and points.
```
let kMaxPair = 9
let kDelayTimeInSeconds = Double(1)
let kCorrectPoints = 2
let kIncorrectPoints = -1
```
Here we create a deck of randomly-ordered cards 

```
    func createDeckOfCards() {
        
        currentScore = 0
        currentActiveDeck.removeAll()
        currentActiveChosenCards.removeAll()
        currentActiveChosenCardsIdx.removeAll()
        flippedCards.removeAll()
        
        var totalCards = kMaxPair * 2
        var gemCardCounter = 1
        var backCardCounter = 1
        
        while(totalCards>0){
            
            var newCard1 = Card(valueFront: gemCardCounter, valueBack: backCardCounter)
            newCard1.cardId = backCardCounter
            currentActiveDeck.append(newCard1)
            backCardCounter+=1
            
            var newCard2 = Card(valueFront: gemCardCounter, valueBack: backCardCounter)
            newCard2.cardId = backCardCounter
            currentActiveDeck.append(newCard2)
            gemCardCounter+=1
            totalCards-=2
        }
        
        currentActiveDeck.shuffle()
        
        backCardCounter = 1
        for card in currentActiveDeck {
            var tempCard = card
            tempCard.imageBack = "Card_Back_\(backCardCounter)"
            tempCard.cardId = backCardCounter
            currentActiveDeck[backCardCounter-1] = tempCard
            backCardCounter += 1
        }
        
    }
```
Here we deal with a card that is being tapped 

```
    func selectCard(card: Card, indexPath: IndexPath) {
        if currentActiveChosenCards.count <= 1 {
            let chosenCard = card
            currentActiveChosenCards.append(chosenCard)
            currentActiveChosenCardsIdx.append(indexPath)
            flippedCards.append(indexPath)
            if currentActiveChosenCards.count == 2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    // your function here
                    self.checkCards()
                }

            }
        }
    }
```

Here we check compare 2 cards once there are 2 cards 

```
    // Card Result :
    // 0 - First Card, Do Nothing, reload
    // 1 - Second Card, Matched, Score, reload
    // 2 - Second Card, MisMatch, Minus Score, reload
    // 3 - Last Pair, Game End
    
    private func checkCards() {
        let isMatched = checkIfMatch()
        if isMatched == true {
            currentActiveChosenCards.removeAll()
            currentActiveChosenCardsIdx.removeAll()
            currentScore += 1
            if currentScore == kMaxPair {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: kGameEndNotificationName), object: nil)
            }else{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: kMatchNotificationName), object: nil)
            }
        }else{
            let firstCard = currentActiveChosenCardsIdx[0]
            let secondCard = currentActiveChosenCardsIdx[1]
            flippedCards = flippedCards.filter({$0 != firstCard})
            flippedCards = flippedCards.filter({$0 != secondCard})
            currentActiveChosenCards.removeAll()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kMisMatchNotificationName), object: nil)
        }
    }
    
    private func checkIfMatch() -> Bool {
        let firstCard = currentActiveChosenCards[0]
        let secondCard = currentActiveChosenCards[1]
            if firstCard.value == secondCard.value {
            return true
            }
        return false
    }
```

## CNPPopupController
I also used this very interesting PopupController by CN to show the slide up dialog box as an end game interaction.

# Release Notes
Version 1.0
* Only allow cards to be flipped if it is unflipped
* Supports iPad only

# Credits
* Joanna C (Designer of the individual graphics)
* Joanna S (Testing and conceptualizing it)

# License
MIT License

Copyright (c) 2016 Lawrence Tan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
