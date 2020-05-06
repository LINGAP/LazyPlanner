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
    @EnvironmentObject var pushViewData:PushViewData

    @State var editingRecipe = recipeData.recipes[0]
    @State private var editing = false
    
    var body: some View {
        NavigationView{
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
            }
            .navigationBarTitle(dayCellVM.date)
        }
    }
    
    func onEdit(){
        if self.editing{
            let recipeRef = Firestore.firestore().document("4/\(editingRecipe.title)")
            do{
                try recipeRef.setData(editingRecipe.asDictionary())
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
