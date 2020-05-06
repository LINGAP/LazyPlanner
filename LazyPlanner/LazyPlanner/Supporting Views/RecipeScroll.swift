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
    @State var selectedRecipe: Recipe?
    let resourceOwner = ResourceOwner()
    @EnvironmentObject var pushViewData:PushViewData
    var recipeResource =  recipeAPI.randomRecipes(count:5)
    var body: some View {
        NavigationView{
            List(randomRecipes, id: \.id){ recipe in
                VStack(alignment: .leading) {
                    RecipeThumbnail(recipe: recipe).onTapGesture {
                       self.pushViewData.selectedRecipe=recipe
                       self.pushViewData.pushed=true
                    }
                  
                }
            }.onAppear(perform: loadData)
        }
    }

//        NavigationView{
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
//            }
//        }.onAppear(perform: loadData)
//    }
    
    
    func loadData()  {
        
//           guard let url = URL(string: "https://api.spoonacular.com/recipes/random?number=3&apiKey=56cf9661e8104e9089c6fd4bb8f82dad") else {
//                    print("invalid URL")
//                    return
//                }
//
//                let request = URLRequest(url: url)
//
//                URLSession.shared.dataTask(with: request) { data, response, error in
//                    do {
//                        let decoder = JSONDecoder()
//                        let decodedResponse = try decoder.decode(MainRecipeCollection.self, from: data!)
//                        print(decodedResponse)
//                    }
//                    catch {
//                        print("Error: \(error)")
//                    }
//        }
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
//        self.recommendedRecipesResource = recipeResource.load()
//            .onSuccess { data in print("Wow! Data!") }
//            .onFailure { error in print("Oh, bummer.") }
        
        // Loading
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
        // The convenience .jsonDict accessor returns empty dict if no
        // data, so the same code can both populate and clear fields.
        _ = resource.jsonDict
        //nameLabel.text = json["name"] as? String
        //favoriteColorLabel.text = json["favoriteColor"] as? String

        //errorLabel.text = resource.latestError?.userMessage ?? "unknown error in last request"
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

