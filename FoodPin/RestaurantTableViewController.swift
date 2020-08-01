//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by chiaqingwu on 2020/7/30.
//  Copyright © 2020 Andrewwuuw. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    override var prefersStatusBarHidden: Bool {
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source
    var checkedList = [
        false, false, false, false, false, false, false,
        false, false, false, false, false, false, false,
        false, false, false, false, false, false, false
    ]
    
    let restaurant = [
            "楠梓區", "左營區", "鼓山區", "三民區", "鹽埕區", "前金區", "新興區",
            "苓雅區", "前鎮區", "小港區", "旗津區", "鳳山區", "大寮區", "鳥松區",
            "林園區", "仁武區", "大樹區", "大社區", "岡山區", "路竹區", "橋頭區"
    ]
    
    let restaurantLocation = [
        "Tapiei", "Ilan", "Tainan", "Hualien", "RCA", "QAQ", "TXT. Re",
        "Tapiei", "Ilan", "Tainan", "Hualien", "RCA", "QAQ", "TXT. Re",
        "Tapiei", "Ilan", "Tainan", "Hualien", "RCA", "QAQ", "TXT. Re"
    ]
    
    let restaurantType = [
        "Cafè", "Tea shop", "Thai", "4river", "ca-ca", "JP", "American",
        "Cafè", "Tea shop", "Thai", "4river", "ca-ca", "JP", "American",
        "Cafè", "Tea shop", "Thai", "4river", "ca-ca", "JP", "American"
    ]
    
    let restaurantImages = [
        "barrafina", "bourkestreetbakery", "cafedeadend", "cafeloisl", "cafelore", "caskpubkitchen",
        "confessional", "donostia", "fiveleaves", "forkeerestaurant", "grahamavenuemeats", "haighschocolate",
        "homei", "palominoespresso", "petiteoyster", "posatelier", "royaloak", "teakha", "traif", "upstate", "wafflewolf"
    ]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurant[indexPath.row]
        cell.locationLabel.text = restaurantLocation[indexPath.row]
        cell.typeLabel.text = restaurantType[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.accessoryType = (checkedList[indexPath.row] == true) ? .checkmark : .none
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurant.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: - Phone alert
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let callAction = UIAlertAction(title: "Call" + "0800-009-\(indexPath.row)", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature isn't available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
        })
        
        let cell = tableView.cellForRow(at: indexPath)
        let isCellSelected = checkedList[indexPath.row]
        let checkMarkActionTitle = isCellSelected ? "Cancel Chech Mark" : "Check Mark"
        
        let checkMarkAction = UIAlertAction(title: checkMarkActionTitle, style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            if isCellSelected {
                cell?.accessoryType = .none
                self.checkedList[indexPath.row] = false
            } else {
                cell?.accessoryType = .checkmark
                self.checkedList[indexPath.row] = true
            }
            
        })
        
        //MARK: - Pad alert
        if let popoverController = optionMenu.popoverPresentationController,
            let cell = tableView.cellForRow(at: indexPath) {
            popoverController.sourceView = cell
            popoverController.sourceRect = cell.bounds
        }
        
        optionMenu.addAction(callAction)
        optionMenu.addAction(checkMarkAction)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
