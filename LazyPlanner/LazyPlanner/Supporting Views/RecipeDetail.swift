//
//  RecipeDetail.swift
//  LazyPlanner
//
//  Created by Ling Ma on 2/9/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe:Recipe
    @EnvironmentObject var pushViewData:PushViewData
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Text(recipe.title)
                    .font(.caption)
                
                ForEach(recipe.extendedIngredients,id: \.id){
                    ingredient in HStack{

                        Text("\(ingredient.name)")
                            
                        Spacer()
                        Divider()
   
                        Spacer()
                            Text("\(ingredient.amount ?? 0)")
                    }.padding(.horizontal)
                }
                Divider()
                
                Text("Instructions")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    
                
                ForEach(recipe.steps,id: \.self){dir
                    in HStack(spacing: 20) {
                        Text("\u{2022}")
                        Text(dir)
                        Spacer()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: MyBackButton(label: "Back!") {
                self.pushViewData.pushed = false
            })
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipeData.recipes[3])

    }
}

struct MyBackButton: View {
    let label: String
    let closure: () -> ()

    var body: some View {
        Button(action: { self.closure() }) {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        }
    }
}
