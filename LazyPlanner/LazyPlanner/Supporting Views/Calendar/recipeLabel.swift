//
//  recipeLabel.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/1/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct recipeLabel: View {
    @ObservedObject var recipeLabelVM:recipeLabelViewModel
   
    var body: some View {
        Text(recipeLabelVM.title)
            .font(.system(size: 23, weight: .light, design: .serif))
            .multilineTextAlignment(.leading)
            .background(recipeLabelVM.recipe.nutrients?.color ?? Color.Theme.grey)
            .frame( alignment: .leading)
    }
}

struct recipeLabel_Previews: PreviewProvider {
    static var previews: some View {
        recipeLabel(recipeLabelVM: recipeLabelViewModel(recipe: recipeData.recipes[3]))
    }
}
