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
        ScrollView(.vertical){
            VStack{
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                   // .edgesIgnoringSafeArea(.top)
                    
                  
                
                Text(recipe.name)
                    .font(.title)
                
                ForEach(recipe.ingredients,id: \.self){
                    ingredient in Text(ingredient.description)
                }
                Spacer()
                
                ForEach(recipe.directions,id: \.self){dir
                    in Text(dir)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipeData[2])
        
        
    }
}
