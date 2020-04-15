//
//  DayCellViewModel.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/5/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import Combine

class DayCellViewModel: ObservableObject {
    @Published var recipeLabelViewModels = [recipeLabelViewModel]()
    var dayAbbr = ""
    var date:String
    private var cancellables = Set<AnyCancellable>()
    init(date:String) {
        self.recipeLabelViewModels = recipeData.recipes.map{recipe in
            recipeLabelViewModel(recipe: recipe)
        }
        self.date = date
//        self.dayAbbr = { () -> String in
//            switch date {
//            case 1:
//                return "Mon"
//            case 2:
//                return "Tue"
//            case 3:
//                return "Wed"
//            case 4:
//                return "Thu"
//            case 5:
//                return "Fri"
//            case 6:
//                return "Sat"
//            case 7:
//                return "Sun"
//            default:
//                return "NA"
//            }
//
//        }()
    }
}
