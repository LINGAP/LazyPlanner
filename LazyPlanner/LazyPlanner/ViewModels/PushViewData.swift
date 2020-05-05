//
//  PushViewData.swift
//  LazyPlanner
//
//  Created by Ling Ma on 5/5/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import Combine
final class PushViewData:ObservableObject{
    @Published var pushed = false
    @Published var selectedRecipe:Recipe = recipeData.recipes[0]
}
