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
    var width:CGFloat = 200
    var height:CGFloat = 200
    var tagSizeRatio:CGFloat = 0.15 //to adjust the relative position of nutrient and price tags
  
    var body: some View {
        
        VStack{
           
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:width,height: height)
                .overlay(Circle()
                    .fill(Color.green)
                    .frame(width:width*tagSizeRatio,height: height*tagSizeRatio)
                    .position(.init(x: width*tagSizeRatio, y: (1-tagSizeRatio)*height))
                    )
                .overlay(Text("HELLO")
                    .font(.callout)
                    .position(.init(x: (1-tagSizeRatio)*width, y: (1-tagSizeRatio)*height)))

            Text(recipe.name)
                .font(.subheadline)
            
        }
        
    }
}

struct RecipeThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeThumbnail(recipe:recipeData[0])
        
    }
}
