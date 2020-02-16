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
        VStack{
            Text(recipe.name)
            Image(recipe.imageName)
                .resizable()
                .frame(width: 300,height: 200)
                .aspectRatio(contentMode: .fill)
            List(recipe.ingredients,id: \.self){
                ingredient in Text(ingredient)
            }
            List(recipe.directions,id: \.self){dir in Text(dir)
                
            }
            

        }
        
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipeData[0])
    }
}
