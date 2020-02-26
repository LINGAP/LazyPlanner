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
        NavigationView{
            ScrollView(.vertical){
                ForEach(categoryList) { category in
                   self.padding(.bottom, 15)
                    
                    Text(category.name)
                        .font(.headline)
                        .foregroundColor(Color.green)
                        .frame(width: 200, height: 0 ,alignment: .leading)
                        
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(category.recipes) { recipe in
                                NavigationLink(destination: RecipeDetail(recipe: recipe)){
                                    RecipeThumbnail(recipe: recipe)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct RecipeScroll_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            RecipeScroll()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

