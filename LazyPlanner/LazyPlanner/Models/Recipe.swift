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
    var ingredients:[Ingredient]
    var directions:[String]
    
    var nutrients: Nutrients
    var price:Price
    var imageName:String

}

extension Recipe {
//    var image: Image {
//        ImageStore.shared.image(name: imageName)//ImageStore is in Data.swift, copy-pasted from the tutorial
//    }
}

struct Ingredient: Hashable, Codable, CustomStringConvertible {
    var ingredient_name: String
    var amount: String?

    var description: String {
        "\(amount ?? " ") |  \(ingredient_name)"
    }
}


struct Nutrients: Hashable, Codable {
    var color: Color{
        if(calories < 300){
            return Color.Theme.nutritionA
        }else if(calories < 500){
            return Color.Theme.nutritionB
        }else{
            return Color.Theme.nutritionC
        }
    }
    var calories: Int
    var protein: Double
    var fat: Double
    var carbohydrates: Double
    
    
}

extension Color {
  struct Theme {
    static var nutritionA: Color  { return Color(red:0, green: 204, blue: 0, opacity: 1) }
    static var nutritionB: Color { return Color(red:204, green: 200, blue: 0, opacity: 1)  }
    static var nutritionC: Color  { return Color(red: 255, green: 0, blue: 85, opacity: 1) }
  }
}

struct Price: Hashable, Codable {
    var totalPrice: Double
    var priceTag: PriceTag {
        if totalPrice < 5 {
            return .low
        } else if totalPrice < 10 {
            return .medium
        } else {
            return .high
        }
    }
    
    enum PriceTag: String, CaseIterable, Codable, Hashable {
        case low = "$"
        case medium = "$$"
        case high = "$$$"
    }
}

