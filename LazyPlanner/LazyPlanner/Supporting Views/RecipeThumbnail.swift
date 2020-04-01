//
//  RecipeThumbnail.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/2/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct RecipeThumbnail: View {
    
    var recipe: Recipe
    var imageWidth: CGFloat = 140
    var imageHeight: CGFloat = 120
    var tagSizeRatio: CGFloat = 0.2 //to adjust the relative position of nutrient and price tags
  
    var body: some View {
        
        VStack{
            Image(recipe.image ?? "")
                .renderingMode(.original)
                .resizable()
                .frame(width: imageWidth,height: imageHeight)
                .aspectRatio(contentMode: .fill)
               
                //Price
                .overlay(
                    Group {
                        Circle()
                        .fill(Color.white)
                        .frame(width: imageWidth*tagSizeRatio,height: imageHeight*tagSizeRatio)
                        
                        Text(recipe.price?.priceTag.rawValue ?? "-")
                        .font(.callout)
                       .offset(CGSize(width: 0, height: -28))
                    }
                    .position(.init(x: (1-tagSizeRatio)*imageWidth, y: (1-tagSizeRatio)*imageHeight))
                    .offset(CGSize(width: 0, height: 15))
            
                )
                
                //Nutrition
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 7)
                    .overlay(
                        Circle()
                            .fill(recipe.nutrients? .color ?? Color.black)
                        )
                    .frame(width:imageWidth*tagSizeRatio,height: imageHeight*tagSizeRatio)
                    .position(.init(x: tagSizeRatio*imageWidth, y: (1-tagSizeRatio)*imageHeight))
                )
   
                
        }
        
    }
}

struct RecipeThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeThumbnail(recipe:recipeData[2])
    }
}
