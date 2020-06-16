//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Quanzhao He on 6/15/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]! //Outlet collection
    @IBOutlet var closeButton: UIButton!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        
        //Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //animation: make the button invisible (method 1 & 2)
//        for rateButton in rateButtons {
//            rateButton.alpha = 0
//        }
        
        //animation: move to right (method 3)
//        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
//        //make the button invisible
//        for rateButton in rateButtons {
//            rateButton.transform = moveRightTransform
//            rateButton.alpha = 0
//        }
        
        //animation: combining animations
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y:0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        //Make the button invisible and move off the screen
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0 
        }
        
        //animation for the close button
        let moveTopTransform = CGAffineTransform.init(translationX: 0, y: -400)
        closeButton.transform = moveTopTransform
        closeButton.alpha = 0
    }
    
    //animation for buttons: method 1 (fade in)
//    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.0) {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[4].alpha = 1.0
//        }
//    }
    
    //animation for buttons: method 2 (delay)
//    override func viewWillAppear(_ animated: Bool) {
//
//        UIView.animate(withDuration: 0.4, delay: 0.1, options:[], animations: {
//            self.rateButtons[0].alpha = 1.0
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.15, options:[], animations: {
//            self.rateButtons[1].alpha = 1.0
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.2, options:[], animations: {
//            self.rateButtons[2].alpha = 1.0
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.25, options:[], animations: {
//            self.rateButtons[3].alpha = 1.0
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.3, options:[], animations: {
//            self.rateButtons[4].alpha = 1.0
//        }, completion: nil)
//    }
      
    
//    //animation for buttons: method 3 (slide in)
//    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.8, delay: 0.1, options: [], animations: {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[0].transform = .identity //remove predefined transformations
//        }, completion: nil)
//
////        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
////            self.rateButtons[0].alpha = 1.0
////            self.rateButtons[0].transform = .identity //remove predefined transformations
////        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[1].transform = .identity //remove predefined transformations
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[2].transform = .identity //remove predefined transformations
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[3].transform = .identity //remove predefined transformations
//        }, completion: nil)
//
//        UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
//            self.rateButtons[4].alpha = 1.0
//            self.rateButtons[4].transform = .identity //remove predefined transformations
//        }, completion: nil)
//
//        //for the close button
//        UIView.animate(withDuration: 0.4, delay: 0.35, options:[], animations: {
//            self.closeButton.alpha = 1.0
//            self.closeButton.transform = .identity
//        }, completion: nil)
//    }

    
    //animation for buttons: method 3 (slide in, but with loop)
        override func viewWillAppear(_ animated: Bool) {
            for index in 0...4{
                let delaySeconds = 0.1 + (0.05 * (Double)(index))
                UIView.animate(withDuration: 0.4, delay: delaySeconds, options:[], animations: {
                    self.rateButtons[index].alpha = 1.0
                    self.rateButtons[index].transform = .identity
                }, completion: nil)
            }
            
            //for the close button
            UIView.animate(withDuration: 0.4, delay: 0.35, options:[], animations: {
                self.closeButton.alpha = 1.0
                self.closeButton.transform = .identity
            }, completion: nil)
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
