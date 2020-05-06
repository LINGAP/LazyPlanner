//
//  RecipeThumbnail.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/2/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI
import URLImage

struct RecipeThumbnail: View {
    
    var recipe: Recipe

    var imageWidth: CGFloat = 180
    var imageHeight: CGFloat = 180
    var tagSizeRatio: CGFloat = 0.35 //to adjust the relative position of nutrient and price tags

  
    var body: some View {
        VStack{
            URLImage(recipe.image,processors: [ Resize(size: CGSize(width: imageWidth, height: imageHeight), scale: UIScreen.main.scale) ],
            content:  {
                $0.image
                .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 50, style: .circular))
                .aspectRatio(contentMode: .fill)
                .clipped()
            })
             // Price
             .overlay(
                Group {
                    Circle()
                    .fill(Color.white)
                    .frame(width: imageWidth*tagSizeRatio,height: imageHeight*tagSizeRatio)

                    Text(recipe.price?.priceTag.rawValue ?? "-")
                    .font(.callout)
                    .offset(CGSize(width: 0, height: -28))
                }
                .position(.init(x: 55, y: 285))
                .offset(CGSize(width: 0, height: 15))
            )
            // Nutrition
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 7)
                .overlay(
                    Circle()
                        .fill(recipe.nutrients? .color ?? Color.black)
                    )
                .frame(width:imageWidth*tagSizeRatio,height: imageHeight*tagSizeRatio)
                .position(.init(x: 275, y: 285))
            )
        }
    }
}

struct RecipeThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeThumbnail(recipe:recipeData.recipes[2])
    }
}
