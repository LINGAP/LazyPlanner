//
//  DayCell.swift
//  LazyPlanner
//
//  Created by Ling Ma on 3/29/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI
import Firebase

struct DayCell: View {
    var dayCellVM:DayCellViewModel
    init(dayCellVM:DayCellViewModel) {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font : UIFont(name:"HelveticaNeue", size: 20)!]
        UINavigationBar.appearance().backgroundColor = .lightGray
        self.dayCellVM = dayCellVM
    }
    
    //var recipeLabels:Set<Recipe>
    //@ObservedObject
    
    @State var editingRecipe = recipeLabelViewModel(recipe: recipeData.recipes[1])
    @State private var editing = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                List{
                    ForEach(dayCellVM.recipeLabelViewModels,id: \.id){recipeLabelVM in
                        NavigationLink(destination: RecipeDetail(recipe: recipeLabelVM.recipe)){
                            recipeLabel(recipeLabelVM: recipeLabelVM)
                        }
                    }
                }
                Button(action:onEdit){
                    HStack{
                        Image(systemName: self.editing ? "circle":"plus.circle.fill")
                            .resizable()
                            .frame(width:20,height:20)
                        Text("edit recipe")
                    }
                }
                .navigationBarTitle(dayCellVM.date)
    
            }
            .border(Color.Theme.grey,width: 5)
        }
        //.frame(width:CGFloat(100))
        
    }
    
    func onEdit(){
        if self.editing{
            let recipeRef = Firestore.firestore().document("Sun/\(editingRecipe.recipe.title)")
            do{
                try recipeRef.setData(editingRecipe.recipe.asDictionary())
            }catch{
                fatalError("Encoding recipe failed:\(error)")
            }
            
            //Test Read Data:
            Firestore.firestore().collection("Sun").getDocuments(){(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    let newRecipe = querySnapshot!.documents.compactMap({Recipe(dictionary: $0.data())})
                    let newRecipeVM = recipeLabelViewModel(recipe: newRecipe[0])
                    
                    self.dayCellVM.recipeLabelViewModels.append(newRecipeVM)
                }
            }
            self.editing = false
        }else{
            self.editing = true
        }
    }

}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell(dayCellVM:DayCellViewModel(date:"20"))
    }
}
