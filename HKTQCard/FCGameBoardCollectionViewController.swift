//
//  FCGameBoardCollectionViewController.swift
//  FlipCollectionViewCell
//
//  Created by Lawrence Tan on 1/10/16.
//  Copyright © 2016 2359 Media Pte Ltd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FCGameCardCollectionViewCell"

let kMaxTimeInSeconds: Int = 120

enum GameState: NSInteger {
    
    case Playing
    case NotPlaying
    case GameEnd
}

class FCGameBoardCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var numberOfSeconds: Int = kMaxTimeInSeconds
    var timer: Timer?
    
    let formatter = DateFormatter()
    let calendar = Calendar.current
    let components: CFCalendarUnit = [.second, .minute]
    
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentGameState: GameState = .NotPlaying
    let cardManager = CMCardDealerManager.sharedInstance()
    var popupController: CNPPopupController?
    
    var lblGameover: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.register(UINib(nibName: "FCGameCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onMisMatch), name: NSNotification.Name(rawValue: kMisMatchNotificationName), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onMatch), name: NSNotification.Name(rawValue: kMatchNotificationName), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onGameEnd), name: NSNotification.Name(rawValue: kGameEndNotificationName), object: nil)
        collectionView.backgroundColor = UIColor.clear
        //btnReset.setTitle("Ready?", for: .normal)
        
        //243,108,46
        
        let strokeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.white,
            NSForegroundColorAttributeName : UIColor(colorLiteralRed: 243.0/255, green: 108/255, blue: 46/255, alpha: 1.0),
            NSStrokeWidthAttributeName : -8.0,
            ] as [String : Any]
        
        lblGameover = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 110))
        lblGameover?.center = view.center
        lblGameover?.textAlignment = .center
        lblGameover?.font = UIFont(name: "Vanilla", size: 100)
        lblGameover?.text = "Game Over"
        lblGameover?.attributedText = NSAttributedString(string: "Game Over", attributes: strokeTextAttributes)
        lblGameover?.alpha = 0
        //view.addSubview(lblGameover!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cardManager.createDeckOfCards()
        collectionView?.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }    

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardManager.currentActiveDeck.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FCGameCardCollectionViewCell
        let card = cardManager.currentActiveDeck[indexPath.row]
        cell.setCardCell(card: card)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if currentGameState == .NotPlaying {
            currentGameState = .Playing
            //startTimer()
            //btnReset.setTitle("Stop", for: .normal)
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
    
    func onMatch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // your function here
            self.popupController?.dismiss(animated: true)
        }
    }
    
    func onMisMatch() {
        for indexPath in cardManager.currentActiveChosenCardsIdx {
            let cell = collectionView?.cellForItem(at: indexPath) as! FCGameCardCollectionViewCell
            cell.flipCardAnimation(indexPath: indexPath)
        }
        cardManager.currentActiveChosenCardsIdx.removeAll()
    }
    
    @IBAction func onReset(_ sender: AnyObject) {
        if currentGameState == .Playing || currentGameState == .GameEnd {
            let alertView = UIAlertController(title: "Are you sure?", message: "Reset Game?", preferredStyle: .alert)
            let actionYes = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                for unflippedCard in self.cardManager.flippedCards {
                    let cell = self.collectionView?.cellForItem(at: unflippedCard) as! FCGameCardCollectionViewCell
                    cell.flipCardAnimation(indexPath: unflippedCard)
                }
                self.cardManager.createDeckOfCards()
                self.collectionView?.reloadData()
                self.currentGameState = .NotPlaying
                self.stopTimer()
                self.numberOfSeconds = kMaxTimeInSeconds
                self.btnReset.setTitle("Ready?", for: .normal)
                self.lblTimer.text = self.timeFormatted(totalSeconds: self.numberOfSeconds)
                UIView.animate(withDuration: 1) {
                    self.lblGameover?.alpha = 0
                }
                self.collectionView.isUserInteractionEnabled = true
            })
            let actionNo = UIAlertAction(title: "No", style: .cancel, handler: { (action) in
                
            })
            alertView.addAction(actionYes)
            alertView.addAction(actionNo)
            present(alertView, animated: true, completion: nil)
        }
    }
    
    func showPopupWithStyle(_ popupStyle: CNPPopupStyle) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.alignment = NSTextAlignment.center
        
        let title = NSAttributedString(string: "Aye! Aye! You collected \(cardManager.currentScore) treasures in", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24), NSParagraphStyleAttributeName: paragraphStyle])
        let lineOne = NSAttributedString(string: "\(kMaxTimeInSeconds-numberOfSeconds-1) seconds!", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 36), NSParagraphStyleAttributeName: paragraphStyle])
        
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0;
        titleLabel.attributedText = title
        titleLabel.font = UIFont(name: "Cubano-Regular", size: 22)
        
        let lineOneLabel = UILabel()
        lineOneLabel.numberOfLines = 0;
        lineOneLabel.attributedText = lineOne;
        lineOneLabel.font = UIFont(name: "Cubano-Regular", size: 36)
        
        let imageView = UIImageView.init(image: UIImage.init(named: "Boy Pirate"))
        imageView.frame = CGRect(x: 20, y: lineOneLabel.frame.origin.y+8, width: 132, height: 200)
        imageView.contentMode = .scaleAspectFit
        
        
        let popupController = CNPPopupController(contents:[titleLabel, lineOneLabel, imageView])
        popupController.theme = CNPPopupTheme.default()
        popupController.theme.popupStyle = popupStyle
        popupController.delegate = self
        self.popupController = popupController
        popupController.present(animated: true)
    }
    
    // MARK: Timer
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func updateTimer() {
        if numberOfSeconds >= 0 {
            lblTimer.text = timeFormatted(totalSeconds: numberOfSeconds)
            numberOfSeconds-=1
        }else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kGameEndNotificationName), object: nil)
            stopTimer()
        }
    }
    
    private func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func onGameEnd() {
        stopTimer()
        showPopupWithStyle(.centered)
        btnReset.setTitle("Reset", for: .normal)
        currentGameState = .GameEnd
        UIView.animate(withDuration: 1) { 
            self.lblGameover?.alpha = 1
        }
        self.collectionView.isUserInteractionEnabled = false
    }
}

extension FCGameBoardCollectionViewController : CNPPopupControllerDelegate {
    
    func popupControllerWillDismiss(_ controller: CNPPopupController) {
        print("Popup controller will be dismissed")
    }
    
    func popupControllerDidPresent(_ controller: CNPPopupController) {
        print("Popup controller presented")
    }
    
}
