//
//  CMCardDealerManager.swift
//  ColourMemory
//
//  Created by 2359 Lawrence on 16/5/16.
//  Copyright © 2016 Lawrence Tan. All rights reserved.
//

import Foundation

//Notifications
let kMisMatchNotificationName = "MisMatchedNotification"
let kMatchNotificationName = "MatchedNotification"
let kGameEndNotificationName = "GameEndNotification"

let kMaxPair = 6
let kDelayTimeInSeconds = Double(1)
let kCorrectPoints = 2
let kIncorrectPoints = -1

class CMCardDealerManager {
    
    //Card Cards Result
    var result = 0
    
    //Current Game Variables
    var currentActiveDeck = [Card]()
    var currentActiveChosenCards = [Card]()
    var currentActiveChosenCardsIdx = [IndexPath]()
    var flippedCards = [IndexPath]()
    
    var currentScore = 0
    var currentPairsFlipped = 0
    
    static let singleton = CMCardDealerManager()
    
    class func sharedInstance() -> CMCardDealerManager {
        return singleton
    }
    
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

}
