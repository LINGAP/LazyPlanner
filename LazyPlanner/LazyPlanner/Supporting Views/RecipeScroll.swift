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
    let recommendedRecipesResource =  recipeAPI.randomRecipes(count:5)
    var body: some View {
        NavigationView{
            
//            ScrollView(.vertical){
//                ForEach(categoryList) { category in
//                   self.padding(.bottom, 15)
//
//                    Text(category.name)
//                        .font(.headline)
//                        .foregroundColor(Color.green)
//                        .frame(width: 200, height: 0 ,alignment: .leading)
//
//                    ScrollView(.horizontal) {
//                        HStack{
//                            ForEach(category.recipes) { recipe in
//                                NavigationLink(destination: RecipeDetail(recipe: recipe)){
//                                    RecipeThumbnail(recipe: recipe)
//                                }
//                            }
//                        }
//                    }
//                }

                List(randomRecipes, id: \.id){ recipe in
                    VStack(alignment: .leading) {
                        Text(recipe.title)
                            .font(.headline)
                        Text(recipe.author ?? "anaymous")
                            .font(.subheadline)
                        
                    }
                }.onAppear(perform: loadData)
 //           }
        }
    }
    
    func loadData()  {
       
        recommendedRecipesResource.addObserver(owner: resourceOwner){
            _,_  in
            let mainRecipeCollection: MainRecipeCollection? = self.recommendedRecipesResource.latestData?.typedContent()
            print("  DEbug  \(mainRecipeCollection.debugDescription)")
            self.randomRecipes = mainRecipeCollection?.recipes ?? []
        }
        
        if(!self.recommendedRecipesResource.isLoading){
            print("ERRRR \(self.recommendedRecipesResource.latestError?.userMessage ?? "unknown error in last request") ")
        }
        
        //TODO:new Data
//        if(keep scrolling down){
//            refresh()
//        }
        
        
        //Load if Needed
        recommendedRecipesResource.loadIfNeeded()
        
    }
    
    func refresh(){
 //       self.recommendedRecipesResource = recommendedRecipesResource.load()
//            .onSuccess { data in print("Wow! Data!") }
//            .onFailure { error in print("Oh, bummer.") }
        
        // Loading
        if(recommendedRecipesResource.isRequesting || recommendedRecipesResource.isLoading){
            //TODO:show spinner
        }
        
        
        //TODO:hide spinner
        if((recommendedRecipesResource.latestError) != nil){
          //  resourceChanged(recommendedRecipesResource,event: nil)
        }
        //TODO:show cached data
    }
    
    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        // The convenience .jsonDict accessor returns empty dict if no
        // data, so the same code can both populate and clear fields.
        let json = resource.jsonDict
        //nameLabel.text = json["name"] as? String
        //favoriteColorLabel.text = json["favoriteColor"] as? String

        //errorLabel.text = resource.latestError?.userMessage ?? "unknown error in last request"
    }
}

struct RecipeScroll_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            RecipeScroll()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

