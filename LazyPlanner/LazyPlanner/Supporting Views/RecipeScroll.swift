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
                        .font(.title)
                        .foregroundColor(Color.green)
                        .frame(width: 200, height: 0 ,alignment: .leading)
                        .offset(x:-70,y:10)
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
        .offset(y:-50)
    }
}

struct RecipeScroll_Previews: PreviewProvider {
    static var previews: some View {
        RecipeScroll()
    }
}

