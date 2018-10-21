//
//  UIViewController.swift
//  ViewControllerContainment
//
//  Created by Glenn Cole on 6/17/18.
//  Copyright © 2018 Glenn Cole. All rights reserved.
//  Based on code created by Bart Jacobs:
//  https://cocoacasts.com/managing-view-controllers-with-container-view-controllers
//

import UIKit

extension UIViewController {
    
    static var storyboardIdentifier: String {
        return String( describing: self )
    }
    
    static func instantiate() -> UIViewController {
        return UIStoryboard.main.instantiateViewController( withIdentifier: self.storyboardIdentifier )
    }
}
