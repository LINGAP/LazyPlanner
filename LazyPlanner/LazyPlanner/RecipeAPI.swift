//
//  APIHelper.swift
//  LazyPlanner
//
//  Created by vodkachamber on 3/7/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import Siesta

class ResourceOwner{
}

class RecipeAPI: Service {
    let jsonDecoder = JSONDecoder()
    
    init() {
        super.init(baseURL: "https://api.spoonacular.com/",standardTransformers: [.text,.image])

        SiestaLog.Category.enabled = .all //print log
//mutateRequest
        configureTransformer("/recipes/*"){//configure parse
            try self.jsonDecoder.decode(MainRecipeCollection.self, from: $0.content)
            
        }
    }
    
    func randomRecipes(count: Int) -> Resource {
        return resource("/recipes/random")
            .withParam("number", String(count))
      //  .withParam("tag",tags )
            .withParam("apiKey", "56cf9661e8104e9089c6fd4bb8f82dad")
    }
    
    func nutritionBreakdown(id:String) -> Resource {
        return resource("recipes").child(id).child("nutritionWidget.json")
        .withParam("apiKey", "56cf9661e8104e9089c6fd4bb8f82dad")
    }
    
    
    
    
}

let recipeAPI = RecipeAPI()



