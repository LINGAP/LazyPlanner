//
//  APIHelper.swift
//  LazyPlanner
//
//  Created by vodkachamber on 3/7/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import Siesta

class RecipeAPI: Service {
    
    init() {
        super.init(baseURL: "https://api.spoonacular.com/recipes/random?number=3&apiKey=56cf9661e8104e9089c6fd4bb8f82dad")
    }
    
    let jsonDecoder = JSONDecoder()
    
    var profile: Resource { return resource("/profile") }
    var items:   Resource { return resource("/items") }

    func item(id: String) -> Resource {
        return items.child(id)
    }
}

let recipeAPI = RecipeAPI()
