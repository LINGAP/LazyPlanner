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
    @State private var editMode = EditMode.inactive
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                List(dayCellVM.recipeLabelViewModels,id: \.id){recipeLabelVM in
                    NavigationLink(destination: RecipeDetail(recipe: recipeLabelVM.recipe)){
                        recipeLabel(recipeLabelVM: recipeLabelVM)
                        }
                }
                
                Button(action: {}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width:20,height:20)
                        Text("add new recipe")
                    }
                }
            }
            .border(Color.Theme.grey,width: 5)
            .navigationBarTitle("Sun")
        }
        
    }

}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell()
    }
}
