//
//  Constant.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 07/05/18.
//  Copyright © 2018 Simform Solutions PVT LTD. All rights reserved.
//

import Foundation
import UIKit

let VIDEO_URL = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"


enum AppStoryboard : String {
    case Main = "Main"
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewController<T: UIViewController>(viewControllerClass : T.Type) -> T{
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}

extension UIViewController{
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiateFromAppStoryboard(appStoryboard : AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
}


