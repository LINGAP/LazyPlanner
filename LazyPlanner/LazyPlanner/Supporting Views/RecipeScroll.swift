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
        ScrollView(.vertical){
            ScrollView(.horizontal) {
                HStack{
                    ForEach(recipeData) { recipe in
                        RecipeThumbnail(recipe: recipe)
                    }
                }
            }
            ScrollView(.horizontal) {
                HStack{
                    ForEach(recipeData) { recipe in
                        RecipeThumbnail(recipe: recipe)
                    }
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
