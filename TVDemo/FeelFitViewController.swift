//
//  FeelFitViewController.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 01/05/18.
//  Copyright © 2018 Darshit Vadodaria. All rights reserved.
//

import UIKit

class FeelFitViewController: UIViewController {

    @IBOutlet weak var btnFit: UIButton!
    @IBOutlet weak var imgFit: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateViews()
    }
    
    func animateViews(){
        self.lblText.alpha = 0.0
        self.imgFit.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.btnFit.center = CGPoint(x:self.btnFit.center.x , y: self.view.frame.size.height + btnFit.frame.size.height)
        UIView.animate(withDuration: 0.5, delay: 0.25,options: UIViewAnimationOptions.curveEaseOut,animations: {
            self.btnFit.center = CGPoint(x: self.btnFit.center.x , y: self.view.frame.size.height - 208.0)
            self.imgFit.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.lblText.alpha = 1.0
            
        },completion:nil)
    }
    
    @IBAction func onClickFeelFit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
