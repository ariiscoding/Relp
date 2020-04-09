//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 28/10/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantIsVisited = Array(repeating: false, count: 21)

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
        
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        cell.accessoryView = restaurantIsVisited[indexPath.row] ? UIImageView.init(image: UIImage(named: "heart-tick")) : .none
        
        return cell
    }
    
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //create an optional menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        //add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        
        //callActionHandler is a closure -> a block of code stored in a variable and passed to callAction to perform when pressed
        let callActionHandler = {
            (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title:"Service Unavailable", message: "Sorry, the call feature is not available yet. Please try later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        //check-in action
        if (self.restaurantIsVisited[indexPath.row] == false) {
            let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
                (action: UIAlertAction!) -> Void in
                let cell = tableView.cellForRow(at: indexPath)
                //cell?.accessoryType = . checkmark
                cell?.accessoryView = UIImageView.init(image: UIImage(named:"heart-tick"))
                self.restaurantIsVisited[indexPath.row] = true
            })
            optionMenu.addAction(checkInAction)
        }
        
        //uncheck action
        if (self.restaurantIsVisited[indexPath.row] == true) {
            let uncheckAction = UIAlertAction(title: "Undo Check in", style: .default, handler: {
                (action: UIAlertAction!) -> Void in
                let cell = tableView.cellForRow(at: indexPath)
                //cell?.accessoryType = .none
                cell?.accessoryView = .none
                self.restaurantIsVisited[indexPath.row] = false
            })
            optionMenu.addAction(uncheckAction)
        }
        
        //for iPad
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        //Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        //deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
