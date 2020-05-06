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

    @EnvironmentObject var pushViewData:PushViewData
    @State private var draggedToCalendar:Bool = false
    var body: some View {
        NavigationView{
            VStack{
                MyCalendar(draggedRecipeVM:self.draggedRecipeVM)
                RecipeScroll()
                
                NavigationLink(destination: RecipeDetail(recipe:self.pushViewData.selectedRecipe), isActive: self.$pushViewData.pushed,label: {EmptyView()})
            
            }
        }
    }
}

struct HomeMainContent_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainContent().environmentObject(PushViewData())
    }
}
