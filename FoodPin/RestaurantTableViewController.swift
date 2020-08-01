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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        cell.nameLabel.text = RestaurantModel.restaurant[indexPath.row]
        cell.locationLabel.text = RestaurantModel.restaurantLocation[indexPath.row]
        cell.typeLabel.text = RestaurantModel.restaurantType[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: RestaurantModel.restaurantImages[indexPath.row])
        cell.heartTick.isHidden = !RestaurantModel.checkedList[indexPath.row]

        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RestaurantModel.restaurant.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)

        if let popoverController = optionMenu.popoverPresentationController,
            let cell = tableView.cellForRow(at: indexPath) {
            popoverController.sourceView = cell
            popoverController.sourceRect = cell.bounds
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let callAction = UIAlertAction(title: "Call" + "0800-009-\(indexPath.row)", style: .default, handler: {
            (action: UIAlertAction!) -> Void in

            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature isn't available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)

        })

        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, CompletionHandler) in

            RestaurantModel.restaurant.remove(at: indexPath.row)
            RestaurantModel.restaurantLocation.remove(at: indexPath.row)
            RestaurantModel.restaurantType.remove(at: indexPath.row)
            RestaurantModel.checkedList.remove(at: indexPath.row)
            RestaurantModel.restaurantImages.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
            CompletionHandler(true)

        }

        let shareAction = UIContextualAction(style: .normal, title: "Share") {
            (action, sourceView, completionHandler) in

            let defaultText = "Just check in at \(RestaurantModel.restaurant[indexPath.row])"
            guard let imageToShare = UIImage(named: RestaurantModel.restaurantImages[indexPath.row]) else { return }
            let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)

            if let popoverController = activityController.popoverPresentationController,
                let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }

            self.present(activityController, animated: true, completion: nil)

            completionHandler(true)

        }

        deleteAction.backgroundColor = UIColor(red: 231 / 255, green: 76 / 255, blue: 60 / 255, alpha: 1)
        deleteAction.image = UIImage(systemName: "trash")

        shareAction.backgroundColor = UIColor(red: 254 / 255, green: 149 / 255, blue: 38 / 255, alpha: 1)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let isCellSelected = RestaurantModel.checkedList[indexPath.row]
        let checkMarkActionTitle = isCellSelected ? "arrow.counterclockwise" : "checkmark"

        let checkMarkAction = UIContextualAction(style: .normal, title: checkMarkActionTitle) {
            (action, sourceView, completionHandler) in

            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell

            cell?.heartTick.isHidden = RestaurantModel.checkedList[indexPath.row]
            RestaurantModel.checkedList[indexPath.row] = RestaurantModel.checkedList[indexPath.row] ? false : true

            completionHandler(true)

        }

        checkMarkAction.backgroundColor = UIColor(red: 38 / 255, green: 191 / 255, blue: 41 / 255, alpha: 75 / 255)
        checkMarkAction.image = UIImage(systemName: checkMarkActionTitle)
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkMarkAction])
        return swipeConfiguration
    }

}
