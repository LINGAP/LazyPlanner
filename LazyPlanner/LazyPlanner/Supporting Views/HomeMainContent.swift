//
//  HomeMainContent.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/21/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct HomeMainContent: View {
    var samples = [recipeLabelViewModel(recipe: recipeData.recipes[0]),recipeLabelViewModel(recipe: recipeData.recipes[1])]
    
    @State var draggedRecipeVM:recipeLabelViewModel?
    let onSelectedRecipe:(Recipe) -> Void
    @State var selectedRecipe:Recipe?
    @State private var draggedToCalendar:Bool = false
    var body: some View {
        VStack{
            MyCalendar(draggedRecipeVM:self.draggedRecipeVM,onSelectedRecipe: {selected in
                self.selectedRecipe = selected
            })
            RecipeScroll()
        }
    }
}


struct HomeMainContent_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainContent(onSelectedRecipe: {_ in})
        
    }
}
