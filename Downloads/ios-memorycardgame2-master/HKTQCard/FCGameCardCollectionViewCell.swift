//
//  FCGameCardCollectionViewCell.swift
//  FlipCollectionViewCell
//
//  Created by Lawrence Tan on 1/10/16.
//  Copyright © 2016 2359 Media Pte Ltd. All rights reserved.
//

import UIKit

class FCGameCardCollectionViewCell: UICollectionViewCell {
    
    let kCardBackTag: Int = 0
    let kCardFrontTag: Int = 1
    
    var cardViews : (frontView: UIImageView, backView: UIImageView)?

    var imgViewFront: UIImageView!
    var imgViewBack: UIImageView!
    
    override func awakeFromNib() {
        imgViewFront = self.createCardViewWithImage(imageName: "", tag: self.kCardFrontTag)
        imgViewFront.layer.cornerRadius = 2.5
        imgViewFront.layer.borderWidth = 5.0
        imgViewFront.layer.borderColor = UIColor.black.cgColor
        imgViewFront.clipsToBounds = true
        imgViewBack = self.createCardViewWithImage(imageName: "", tag: self.kCardBackTag)
        imgViewBack.layer.cornerRadius = 2.5
        imgViewBack.layer.borderWidth = 5.0
        imgViewBack.layer.borderColor = UIColor.white.cgColor
        imgViewBack.clipsToBounds = true
        cardViews = (frontView: imgViewFront, backView: imgViewBack)
        contentView.addSubview(imgViewBack)
    }
    
    func setCardCell(card: Card) {
        imgViewFront.image = UIImage(named: card.imageFront)
        imgViewBack.image = UIImage(named: card.imageBack)
    }
    
    func flipCardAnimation(indexPath: IndexPath) {
        
        if (imgViewBack.superview != nil) {
            cardViews = (frontView: imgViewFront, backView: imgViewBack)
        }else{
            cardViews = (frontView: imgViewBack, backView: imgViewFront)
        }
        
        let transitionOptions = UIViewAnimationOptions.transitionFlipFromLeft
        
        UIView.transition(with: self.contentView, duration: 0.5, options: transitionOptions, animations: {
            
            self.cardViews!.backView.removeFromSuperview()
            
            self.contentView.addSubview(self.cardViews!.frontView)
            
            }, completion: { finished in
               print(indexPath)
        })

    }
    
    private func createCardViewWithImage(imageName: String, tag: Int) -> UIImageView {
        let newCardImageView = UIImageView(frame: self.frame)
        newCardImageView.image = UIImage(named: imageName)
        newCardImageView.contentMode = .scaleAspectFit
        newCardImageView.tag = tag
        return newCardImageView
    }
    

}
