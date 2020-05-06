//
//  DayCellViewModel.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/5/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import Combine
import Firebase

class DayCellViewModel: ObservableObject {
    @Published var recipeLabelViewModels = [recipeLabelViewModel]()

    @Published var date:String
    var dayAbb:String{return getWeekdayAbbr(day: day)}
    var day:Int
    private var cancellables = Set<AnyCancellable>()
    init(date:String,day:Int) {
        self.date = date
        self.day = day
    }
    
    
    public func loadDayRecipe(){
        let day = self.day
        if day < 0 || day > 7 {
            print("load calendar recipe faild. day \(day)")
            return
        }
        //Test Read Data:
        Firestore.firestore().collection(String(day)).getDocuments(){(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let dbRecipes = querySnapshot!.documents.compactMap({Recipe(dictionary: $0.data())})
                for recipe in dbRecipes {
                    let newRecipeVM = recipeLabelViewModel(recipe: recipe)
                    self.recipeLabelViewModels.append(newRecipeVM)
                }
            }
        }
    }
    
}

fileprivate func getWeekdayAbbr(day:Int) -> String {
    switch (day) {
        case 1:
            return "Mon"
        case 2:
            return "Tue"
        case 3:
            return "Wed"
        case 4:
            return "Thu"
        case 5:
            return "Fri"
        case 6:
            return "Sat"
        default:
            return "Sun"
    }
}

