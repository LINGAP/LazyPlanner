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

var nonVeggie: RecipeCategory = RecipeCategory(name: "Non-vegetarian", recipes: [recipeData[0],recipeData[2],recipeData[3],recipeData[5]])

var vegetarian: RecipeCategory = RecipeCategory(name: "Vegetarian", recipes: [recipeData[1],recipeData[4],recipeData[6]])

var categoryList: [RecipeCategory] = [nonVeggie, vegetarian]
