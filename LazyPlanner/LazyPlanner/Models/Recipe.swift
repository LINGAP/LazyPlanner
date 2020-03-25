//
//  Recipe.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/2/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MainRecipeCollection: Codable {
    var recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    var id: Int
    var title: String
    var author:String?
    var readyInMinutes:Int
    var image:String
    
    var extendedIngredients:[Ingredient]
//    var ingredients:[Ingredient]
    var instructions:String
    var steps:[String]{
        return instructions.split(separator: "\n").map(String.init)
    }
    
    
    var nutrients: Nutrients
    var price:Price
    

}



struct Ingredient: Hashable, Codable, CustomStringConvertible {
    var id:Int
    var aisle:String
    var name: String
    var amount: String?
    var unit:String
    var description: String {
        "\(amount ?? " ") \(unit) |  \(name)"
    }
}


struct Nutrients: Hashable, Codable {
    var color: Color{
        if(healthScore > 70){
            return Color.Theme.nutritionA
        }else if(healthScore > 40){
            return Color.Theme.nutritionB
        }else{
            return Color.Theme.nutritionC
        }
    }
    
    var healthScore: Int
}

extension Color {
  struct Theme {
    static var nutritionA: Color  { return Color(red:0, green: 204, blue: 0, opacity: 1) }
    static var nutritionB: Color { return Color(red:204, green: 200, blue: 0, opacity: 1)  }
    static var nutritionC: Color  { return Color(red: 255, green: 0, blue: 85, opacity: 1) }
  }
}

struct Price: Hashable, Codable {
    var pricePerServing: Double
    var priceTag: PriceTag {
        if (pricePerServing < 150) {
            return .low
        } else if (pricePerServing < 300) {
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

