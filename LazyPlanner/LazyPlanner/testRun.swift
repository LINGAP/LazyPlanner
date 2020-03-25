//
//  testRun.swift
//  LazyPlanner
//
//  Created by vodkachamber on 3/11/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import SwiftUI
import Siesta

struct testRun: View {
    @State var testRecipes = [TestRecipe]()
    let resourceOwner = ResourceOwner()
    
    var body: some View {
        List(testRecipes, id: \.id){ testRecipe in
            VStack(alignment: .leading) {
                Text(testRecipe.title)
                    .font(.headline)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData()  {
        let r = recipeAPI.randomRecipes(count: 3)

        r.addObserver(owner: resourceOwner){
            _,_  in
            let recipeCollection: RecipeCollection? = r.typedContent()
            self.testRecipes = recipeCollection?.recipes ?? []
        }
        r.loadIfNeeded()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        testRun()
    }
}
