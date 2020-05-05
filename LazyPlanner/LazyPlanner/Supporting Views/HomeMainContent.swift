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
    @State var showDetail = false
    @EnvironmentObject var pushViewData:PushViewData
    @State private var draggedToCalendar:Bool = false
    var body: some View {
        NavigationView{
            VStack{
                MyCalendar(draggedRecipeVM:self.draggedRecipeVM,onSelectedRecipe: {selected in
                    self.selectedRecipe = selected
                    self.pushViewData.pushed=true
                })
                RecipeScroll()
                
                NavigationLink(destination: RecipeDetail(recipe:selectedRecipe ?? samples[0].recipe), isActive: self.$pushViewData.pushed,label: {EmptyView()})
            
            }
        
        }
    }
}

struct HomeMainContent_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainContent(onSelectedRecipe: {_ in}).environmentObject(PushViewData())
    }
}
