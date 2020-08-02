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
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
        restaurantLocationLabel.text = restaurant.location
        restaurantTypeLabel.text = restaurant.type
    }

}
