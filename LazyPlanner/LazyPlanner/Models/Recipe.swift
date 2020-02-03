//
//  Recipe.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/2/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI
import CoreLocation //I'm not sure what this does, copide from tutorial
struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var ingredients:[String] //supposed to be a list, corresponds to json
    var directions:String
    
    fileprivate var nutrients: Nutrients //set to be fileprivate because I wonder if some processing should be applied before use this part
    fileprivate var price:Price
    var imageName:String

}

extension Recipe {
//    var image: Image {
//        ImageStore.shared.image(name: imageName)//ImageStore is in Data.swift, copy-pasted from the tutorial
//    }
}

struct Nutrients: Hashable, Codable {
    var calories: Int
    var protein: Double
    var fat: Double
    var carbohydrates: Double
}

struct Price: Hashable, Codable {
    var totalPrice: Double
    var pricetag: PriceTag
    
    enum PriceTag: String, CaseIterable, Codable, Hashable {
        case low = "$"
        case medium = "$$"
        case high = "$$$"
    }
}

