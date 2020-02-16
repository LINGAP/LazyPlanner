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
    var ingredients:[String]
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

//struct Ingredients {
//    <#fields#>
//}


struct Nutrients: Hashable, Codable {
    var color: ScoreColor{
        if(calories < 500){
            return .A
        }else if(calories < 650){
            return .B
        }else{
            return .C
        }
    }
    var calories: Int
    var protein: Double
    var fat: Double
    var carbohydrates: Double
    
    enum ScoreColor: String, CaseIterable, Codable, Hashable {
        case A = "green"
        case B = "yellow"
        case C = "pink"
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

