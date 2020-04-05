//
//  testData.swift
//  LazyPlanner
//
//  Created by vodkachamber on 3/11/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation

struct RecipeCollection: Codable {
    var recipes: [TestRecipe]
}

struct TestRecipe: Codable {
    var id: Int
    var title: String
    var image:String
}
