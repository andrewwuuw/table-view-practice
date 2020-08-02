//
//  RastaurantDetailViewController.swift
//  FoodPin
//
//  Created by chiaqingwu on 2020/8/2.
//  Copyright © 2020 Andrewwuuw. All rights reserved.
//

import UIKit

class RastaurantDetailViewController: UIViewController {

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    
    var restaurantImageName = ""
    var restaurantName = ""
    var restaurantLocation = ""
    var restaurantType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantNameLabel.text = restaurantImageName
        restaurantLocationLabel.text = restaurantLocation
        restaurantTypeLabel.text = restaurantType
    }

}
