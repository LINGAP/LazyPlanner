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

struct Recipe: Codable, Identifiable,Hashable {
    var id: Int
    var title: String
    var author:String?
    var readyInMinutes:Int
    var image:String?
    
    var extendedIngredients:[Ingredient]

    var instructions:String
    var steps:[String]{
        return instructions.split(separator: "\n").map(String.init)
    }
    
    //private var healthScore:Nutrients.Nutrients
    
    var nutrients: Nutrients?
    //{return healthScore.Nutrients}
    var price:Price?
    

}



struct Ingredient: Hashable, Codable, CustomStringConvertible {
    var id:Int
    var aisle:String
    var name: String
    var amount: Double?
    var unit:String
    var description: String {
        "\(amount ?? 0) \(unit) |  \(name)"
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
    
    var visulBreakdown:String{"Nil"}
    
    let healthScore: Double
}

private extension Nutrients {
    struct Nutrients: Hashable, Codable {
        let values:[Nutrients]
        var color: Color{
            if(healthScore > 70){
                return Color.Theme.nutritionA
            }else if(healthScore > 40){
                return Color.Theme.nutritionB
            }else{
                return Color.Theme.nutritionC
            }
        }
        
        var visulBreakdown:String{"Nil"}
        
        let healthScore: Double
        
        
        
    }
    
}

extension Color {
  struct Theme {
    static var nutritionA: Color  { return Color(red:0, green: 0.7, blue: 0, opacity: 1) }
    static var nutritionB: Color { return Color(red:0.75, green: 0.77, blue: 0, opacity: 1)  }
    static var nutritionC: Color  { return Color(red: 0.9, green: 0, blue: 0.35, opacity: 1) }
    static var grey:Color { return Color(red:0.7,green:0.7,blue:0.7,opacity:1)}
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

