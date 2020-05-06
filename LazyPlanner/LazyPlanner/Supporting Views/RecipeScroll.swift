//
//  RecipeScroll.swift
//  LazyPlanner
//
//  Created by vodkachamber on 2/10/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//
import Foundation
import SwiftUI
import Siesta

struct RecipeScroll: View {
    @State var randomRecipes = [Recipe]()
    let resourceOwner = ResourceOwner()
    @EnvironmentObject var pushViewData:PushViewData
    var recipeResource =  recipeAPI.randomRecipes(count:5)
    var body: some View {
        NavigationView{
            List(recipeData.recipes, id: \.id){ recipe in
                VStack(alignment: .leading) {
                    NavigationLink(destination: RecipeDetail(recipe: recipe)){
                        RecipeThumbnail(recipe: recipe).onTapGesture {
                           self.pushViewData.selectedRecipe=recipe
                           self.pushViewData.pushed=true
                            }
                        .itemProvider {
                            return NSItemProvider(object: DragRecipeData(recipe:recipe))
                        }
                    }
                }
            }
            //.onAppear(perform: loadData)
        }
    }

    
    
    func loadData()  {

        recipeResource.addObserver(owner: resourceOwner){
            _,_  in
            let mainRecipeCollection: MainRecipeCollection? = self.recipeResource.latestData?.typedContent()
            print("  DEbug  \(mainRecipeCollection.debugDescription)")
            self.randomRecipes = mainRecipeCollection?.recipes ?? []
            
            if(!self.recipeResource.isLoading && (self.recipeResource.latestError != nil)){
                print("ERRRR \(self.recipeResource.latestError?.userMessage ?? "unknown error in last request") ")
            }
        }

        //Load if Needed
        recipeResource.loadIfNeeded()
        
    }
    
    func refresh(){

        if(recipeResource.isLoading){
            //TODO:show spinner
        }
        
        
        //TODO:hide spinner
        if((recipeResource.latestError) != nil){
          //  resourceChanged(recommendedRecipesResource,event: nil)
        }
        //TODO:show cached data
    }
    
    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        _ = resource.jsonDict

    }
}


struct RecipeScroll_Previews: PreviewProvider {
    static var previews: some View {
        //"iPhone SE"
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            RecipeScroll()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

