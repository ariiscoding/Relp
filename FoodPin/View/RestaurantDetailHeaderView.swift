//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Quanzhao He on 5/22/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        //enable  atuomatically determine total number of lines to fit content
        didSet {
            nameLabel.numberOfLines = 0 // 0 means automatic
        }
    }
    @IBOutlet var typeLabel: UILabel! {
        //to enable rounded corner
        didSet {
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true 
        }
    }
    @IBOutlet var heartImageView: UIImageView!{
        //load the image as a template so we can change its color
        didSet {
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
