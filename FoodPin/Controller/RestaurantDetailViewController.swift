//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Quanzhao He on 5/20/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet var restaurantImageView : UIImageView!
    @IBOutlet var restaurantNameLabel : UILabel!
    @IBOutlet var restaurantTypeLabel : UILabel!
    @IBOutlet var restaurantLocationLabel : UILabel!
    
//    var restaurantImageName = ""
//    var restaurantName = ""
//    var restaurantType = ""
//    var restaurantLocation = ""
    
    var restaurant = Restaurant()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurant.image)
        navigationItem.largeTitleDisplayMode = .never
        
        restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = restaurant.type
        restaurantLocationLabel.text = restaurant.location
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
