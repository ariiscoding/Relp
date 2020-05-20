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
    var restaurantImageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurantImageName)
        navigationItem.largeTitleDisplayMode = .never
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
