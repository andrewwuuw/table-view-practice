//
//  RestaurantModel.swift
//  FoodPin
//
//  Created by chiaqingwu on 2020/8/1.
//  Copyright © 2020 Andrewwuuw. All rights reserved.
//

class Restaurant {
    var name: String
    var location: String
    var type: String
    var image: String
    var isVisited: Bool

    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.isVisited = isVisited
    }

    convenience init() {
        self.init(name: "", type: "", location: "", image: "", isVisited: false)
    }
}
