//
//  WorkoutTableViewCell.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 04/05/18.
//  Copyright © 2018 Simform Solutions PVT LTD. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgWork: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var dictWorkOut:[String:Any]?{
        didSet{
            setData()
        }
    }
    
    func setData(){
        self.lblTitle.text = "\(dictWorkOut?["title"] ?? "")"
        self.lblSubTitle.text = "\(dictWorkOut?["infoText"] ?? "")"
        self.imgWork.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        if self.isFocused{
             self.imgWork.isHidden = false
        }
        else{
           self.imgWork.isHidden = true
        }
       
    }

}
