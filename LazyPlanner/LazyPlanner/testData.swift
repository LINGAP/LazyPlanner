//
//  testData.swift
//  LazyPlanner
//
//  Created by vodkachamber on 3/11/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation

struct TestRecipes: Codable {
    var testRecipes: [TestRecipe]
}

struct TestRecipe: Codable {
    var id: Int
    var title: String
}
