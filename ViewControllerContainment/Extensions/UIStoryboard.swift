//
//  UIStoryboard.swift
//  ViewControllerContainment
//
//  Created by Glenn Cole on 6/17/18.
//  Copyright © 2018 Glenn Cole. All rights reserved.
//  Based on code created by Bart Jacobs:
//  https://cocoacasts.com/managing-view-controllers-with-container-view-controllers
//

import UIKit

extension UIStoryboard {
    
    static var main: UIStoryboard {
        return UIStoryboard( name: "Main", bundle: Bundle.main )
    }
}
