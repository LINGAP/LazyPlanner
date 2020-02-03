//
//  RecipeThumbnail.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/2/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct RecipeThumbnail: View {
    var recipe:Recipe
    var body: some View {
        Image("seafood-risotto")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(Circle().padding())

            
        
    }
}

struct RecipeThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeThumbnail(recipe:recipeData[0])//recipe:RecipeData[0], evoked error when try to load the json
        
    }
}
