//
//  recipeLabel.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/1/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct recipeLabel: View {
    var recipe:Recipe
    var body: some View {
        Text(recipe.title)
            .background(recipe.nutrients?.color ?? Color.Theme.grey)
            .frame(maxWidth: CGFloat(70), alignment: .leading)
    }
}

struct recipeLabel_Previews: PreviewProvider {
    static var previews: some View {
        recipeLabel(recipe: recipeData.recipes[3])
    }
}
