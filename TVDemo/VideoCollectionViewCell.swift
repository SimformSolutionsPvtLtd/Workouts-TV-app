//
//  VideoCollectionViewCell.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 27/04/18.
//  Copyright © 2018 Darshit Vadodaria. All rights reserved.
//

import UIKit
import ParallaxView
class VideoCollectionViewCell: ParallaxCollectionViewCell {
    
    @IBOutlet weak var imgThumb: UIImageView!
    
    fileprivate var widthToHeightRatio = CGFloat(0)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Here you can configure custom properties for parallax effect
        cornerRadius = 10
        
        parallaxEffectOptions.glowAlpha = 0.4
        parallaxEffectOptions.shadowPanDeviation = 10
        parallaxEffectOptions.parallaxMotionEffect.viewingAngleX = CGFloat(Double.pi/4/30)
        parallaxEffectOptions.parallaxMotionEffect.viewingAngleY = CGFloat(Double.pi/4/30)
        parallaxEffectOptions.parallaxMotionEffect.panValue = CGFloat(5)
        
        // You can customise parallax view standard behaviours using parallaxViewActions property.
        // Do not forget to use weak self if needed to void retain cycle
        parallaxViewActions.setupUnfocusedState = { (view) -> Void in
            view.transform = CGAffineTransform.identity
            
            view.layer.shadowOffset = CGSize(width: 0, height: 10)
            view.layer.shadowOpacity = 0.3
            view.layer.shadowRadius = 5
            view.layer.shadowColor = UIColor.black.cgColor
        }
        
        parallaxViewActions.setupFocusedState = { [weak self] (view) -> Void in
            guard let _self = self else { return }
            view.transform = CGAffineTransform(scaleX: 1.08, y: _self.widthToHeightRatio)
            
            view.layer.shadowOffset = CGSize(width: 0, height: 20)
            view.layer.shadowOpacity = 0.4
            view.layer.shadowRadius = 15
            view.layer.shadowColor = view.backgroundColor?.cgColor
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        widthToHeightRatio = round(((bounds.width * 0.08 + bounds.height)/bounds.height)*100)/100
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.borderWidth = 0.0
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        if self.isFocused{
           self.contentView.layer.borderWidth = 1.0
        }
        else{
            self.contentView.layer.borderWidth = 0.0
        }
        
    }
}
