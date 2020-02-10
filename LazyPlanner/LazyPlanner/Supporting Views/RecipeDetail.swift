//
//  RecipeDetail.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/9/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe:Recipe
    var body: some View {
        Text(recipe.name)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipeData[0])
    }
}
