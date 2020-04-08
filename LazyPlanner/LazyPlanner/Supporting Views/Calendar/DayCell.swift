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
    @ObservedObject var dayCellVM = DayCellViewModel()
    @ObservedObject var editingRecipe = recipeLabelViewModel(recipe: recipeData.recipes[0])
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
                .navigationBarTitle("Sun")
            }
            .border(Color.Theme.grey,width: 5)
            
        }
        
    }
    
    func onEdit(){
        if self.editing{
            self.dayCellVM.recipeLabelViewModels.append(editingRecipe)
            self.editing = false
        }else{
            self.editing = true
        }
    }

}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell()
    }
}
