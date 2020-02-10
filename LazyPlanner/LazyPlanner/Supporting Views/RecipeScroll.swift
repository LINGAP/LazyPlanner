//
//  RecipeScroll.swift
//  LazyPlanner
//
//  Created by vodkachamber on 2/10/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct RecipeScroll: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(recipeData) { recipe in
                    RecipeThumbnail(recipe: recipe)
                    Spacer()
            }
        }
    }
}

struct RecipeScroll_Previews: PreviewProvider {
    static var previews: some View {
        RecipeScroll()
    }
}
}
