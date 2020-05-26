//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Quanzhao He on 5/25/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MapKit


class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
