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

    @Published var date:String
    private var cancellables = Set<AnyCancellable>()
    init(date:String) {
        self.recipeLabelViewModels = recipeData.recipes.map{recipe in
            recipeLabelViewModel(recipe: recipe)
        }
        self.date = date
    }
}
