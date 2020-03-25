//
//  RecipeList.swift
//  LazyPlanner
//
//  Created by Apple on 2/5/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    var body: some View {
        NavigationView {
            List(recipeData) { recipe in
                NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                    RecipeThumbnail(recipe: recipe)
                }
            }
            .navigationBarTitle(Text("RecipeSection"))
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}

