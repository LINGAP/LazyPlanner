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
        super.init(baseURL: "https://api.spoonacular.com/",standardTransformers: [.text,.image])

        SiestaLog.Category.enabled = .detailed

        configureTransformer("/recipes/**"){
            try self.jsonDecoder.decode(RecipeCollection.self, from: $0.content)
        }
    }
    
    let jsonDecoder = JSONDecoder()
    
    func randomRecipes(count: Int) -> Resource {
        return resource("/recipes/random")
            .withParam("number", String(count))
            .withParam("apiKey", "56cf9661e8104e9089c6fd4bb8f82dad")
    }
}

let recipeAPI = RecipeAPI()
