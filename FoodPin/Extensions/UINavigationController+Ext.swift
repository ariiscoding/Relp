//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Quanzhao He on 5/23/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation

import UIKit
extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        //override this function so we can change Status Bar individually for each view
        return topViewController
    }
    
}
