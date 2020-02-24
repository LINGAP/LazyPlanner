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
        RecipeScroll()
    }
}

