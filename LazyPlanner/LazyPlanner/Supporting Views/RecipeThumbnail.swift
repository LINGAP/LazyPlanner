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
        VStack{
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:200,height: 200)
                .overlay(Circle()
                    .fill(Color.green)
                    .frame(width:30,height: 30)
                    .position(.init(x: 30, y: 170))
                    )
                
            Text(recipe.name)
                .font(.caption)
            
        }
        
    }
}

struct RecipeThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeThumbnail(recipe:recipeData[0])
        
    }
}
