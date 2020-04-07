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
                Image(recipe.image ?? "")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.top)
                    
                  //ingredients
                Text(recipe.title)
                    .font(.caption)
                
                ForEach(recipe.extendedIngredients,id: \.id){
                    ingredient in HStack{

                        Text("\(ingredient.name)")
                            
                        Spacer()
                        Divider()
   
                        Spacer()
                            Text("\(ingredient.amount ?? 0)")
                               // .multilineTextAlignment(.trailing)
                                //.alignmentGuide(.leading) { d in d[.trailing] }
                    }.padding(.horizontal)
                       
                }
                Divider()
                
                Text("Instructions")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    
                
                ForEach(recipe.steps,id: \.self){dir
                    in HStack(spacing: 20) {
                        Text("\u{2022}")
                        Text(dir)
                        Spacer()
                    }
                }
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipeData.recipes[3])
        
        
    }
}
