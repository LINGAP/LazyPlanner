//
//  RecipeCategory.swift
//  LazyPlanner
//
//  Created by vodkachamber on 2/16/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct RecipeCategory: Identifiable {
    var id = UUID()
    var name: String
    var recipes: [Recipe]
}


var nonVeggie: RecipeCategory = RecipeCategory(name: "Non-vegetarian", recipes: [recipeData.recipes[0],recipeData.recipes[2],recipeData.recipes[3],recipeData.recipes[5]])

var vegetarian: RecipeCategory = RecipeCategory(name: "Vegetarian", recipes: [recipeData.recipes[1],recipeData.recipes[4]])

//var dessert:RecipeCategory = RecipeCategory(name: "Dessert", recipes:recipeAPI.loadRecipeCategory(tags:["dessert"]) )

var categoryList: [RecipeCategory] = [nonVeggie, vegetarian]
