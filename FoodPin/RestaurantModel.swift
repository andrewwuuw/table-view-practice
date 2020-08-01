//
//  RestaurantModel.swift
//  FoodPin
//
//  Created by chiaqingwu on 2020/8/1.
//  Copyright © 2020 Andrewwuuw. All rights reserved.
//

import Foundation

struct RestaurantModel {

    static var checkedList = Array(repeating: false, count: 21)
    
    static var restaurant = [
        "楠梓區", "左營區", "鼓山區", "三民區", "鹽埕區", "前金區", "新興區",
        "苓雅區", "前鎮區", "小港區", "旗津區", "鳳山區", "大寮區", "鳥松區",
        "林園區", "仁武區", "大樹區", "大社區", "岡山區", "路竹區", "橋頭區"
    ]

    static var restaurantLocation = [
        "Tapiei", "Ilan", "Tainan", "Hualien", "RCA", "QAQ", "TXT. Re",
        "Tapiei", "Ilan", "Tainan", "Hualien", "RCA", "QAQ", "TXT. Re",
        "Tapiei", "Ilan", "Tainan", "Hualien", "RCA", "QAQ", "TXT. Re"
    ]

    static var restaurantType = [
        "Cafè", "Tea shop", "Thai", "4river", "ca-ca", "JP", "American",
        "Cafè", "Tea shop", "Thai", "4river", "ca-ca", "JP", "American",
        "Cafè", "Tea shop", "Thai", "4river", "ca-ca", "JP", "American"
    ]

    static var restaurantImages = [
        "barrafina", "bourkestreetbakery", "cafedeadend", "cafeloisl", "cafelore", "caskpubkitchen",
        "confessional", "donostia", "fiveleaves", "forkeerestaurant", "grahamavenuemeats", "haighschocolate",
        "homei", "palominoespresso", "petiteoyster", "posatelier", "royaloak", "teakha", "traif", "upstate", "wafflewolf"
    ]
    
}
