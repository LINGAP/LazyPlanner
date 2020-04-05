//
//  DayCell.swift
//  LazyPlanner
//
//  Created by Ling Ma on 3/29/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct DayCell: View {
    //var recipeLabels:Set<Recipe>
    var recipeLabels:[Recipe]
    @State private var editMode = EditMode.inactive
    var body: some View {
        NavigationView{
            VStack{
                Text("Sun")
                List(recipeLabels,id: \.id){recipe in
                     NavigationLink(destination: RecipeDetail(recipe: recipe)){
                            recipeLabel(recipe: recipe)
                        }
                }
            }
        }.border(Color.Theme.grey,width: 5)
    }

}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell(recipeLabels: recipeData.recipes)
    }
}
