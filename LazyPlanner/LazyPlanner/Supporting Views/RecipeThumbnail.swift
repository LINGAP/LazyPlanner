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
    var width:CGFloat = 140
    var height:CGFloat = 120
    var tagSizeRatio:CGFloat = 0.2 //to adjust the relative position of nutrient and price tags
    
  
    var body: some View {
        
        VStack{
            Image(recipe.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width:width,height: height)
                .aspectRatio(contentMode: .fill)
               
                
                .overlay(
                    Group {
                        Circle()
                        .fill(Color.white)
                        .frame(width:width*tagSizeRatio,height: height*tagSizeRatio)
                        
                        Text(recipe.price.priceTag.rawValue)
                        .font(.callout)
                       .offset(CGSize(width: 0, height: -28))
                    }
                    .position(.init(x: (1-tagSizeRatio)*width, y: (1-tagSizeRatio)*height))
                    .offset(CGSize(width: 0, height: 15))
            
                )
                
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 7)
                    .overlay(
                        Circle()
                            .fill(recipe.nutrients.color)
                        )
                    .frame(width:width*tagSizeRatio,height: height*tagSizeRatio)
                    .position(.init(x: tagSizeRatio*width, y: (1-tagSizeRatio)*height))
                )
            
            Text(recipe.name)
                .font(.subheadline)
                .padding(.top)
                
            
        }
        
    }
}

struct RecipeThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeThumbnail(recipe:recipeData[2])
    }
}
