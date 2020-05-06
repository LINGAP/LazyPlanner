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
    @ObservedObject var dayCellVM:DayCellViewModel
    
//    init(dayCellVM:DayCellViewModel,onSelectedRecipe:@escaping (Recipe)->Void) {
//        UINavigationBar.appearance().backgroundColor = .lightGray
//        UINavigationBar.appearance().largeTitleTextAttributes = [
//            .font : UIFont(name:"Papyrus", size: 20)!]
//        UINavigationBar.appearance().titleTextAttributes = [
//            .font : UIFont(name: "HelveticaNeue-Thin", size: 20)!]
//        self.dayCellVM = dayCellVM
//        self.onSelectedRecipe = onSelectedRecipe
//    }
    

    @EnvironmentObject var pushViewData:PushViewData
    @State var draggedRecipeVM:recipeLabelViewModel?
    //let onSelectedRecipe:(Recipe) -> Void
    @State var editingRecipe = recipeLabelViewModel(recipe: recipeData.recipes[2])
    @State private var editing = false
    @GestureState var tap = false
    
    var body: some View {
       // NavigationView{
            ScrollView(.vertical){
            VStack(alignment: .leading){
                    ForEach(dayCellVM.recipeLabelViewModels,id: \.id){recipeLabelVM in
                     
                        recipeLabel(recipeLabelVM: recipeLabelVM)
                            .onTapGesture {
                                self.pushViewData.selectedRecipe=recipeLabelVM.recipe
                                self.pushViewData.pushed=true

                        }
               
                    }
                }
            .onAppear(perform: dayCellVM.loadDayRecipe)
                Button(action:onEdit){
                    HStack{
                        Image(systemName: self.editing ? "circle":"plus.circle.fill")
                            .resizable()
                            .frame(width:20,height:20)
                        Text("edit recipe")
                    }
                }
          //  } .navigationBarTitle(dayCellVM.date)
            
        }
        //.frame(width:CGFloat(100))
    }
    
    func onEdit(){
        if self.editing{
            let recipeRef = Firestore.firestore().document("6/\(editingRecipe.recipe.title)")
            do{
                try recipeRef.setData(editingRecipe.recipe.asDictionary())
            }catch{
                fatalError("Encoding recipe failed:\(error)")
            }
            self.editing = false
        }else{
            self.editing = true
        }
    }

}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell(dayCellVM:DayCellViewModel(date:"20", day: 6)).environmentObject(PushViewData())
    }
}
//,onSelectedRecipe: {_ in}
