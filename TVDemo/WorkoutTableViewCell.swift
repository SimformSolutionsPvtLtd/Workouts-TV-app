//
//  WorkoutTableViewCell.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 04/05/18.
//  Copyright © 2018 Darshit Vadodaria. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgWork: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
         self.imgWork.isHidden = !self.isFocused
    }

}
