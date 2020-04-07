//
//  recipeLabelViewModel.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/5/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class recipeLabelViewModel: ObservableObject, Identifiable {
    @Published var recipe:Recipe
    var id = 0
    var title = ""
    @Published var color = Color.Theme.grey
    private var cancellables = Set<AnyCancellable>()
    
    init(recipe:Recipe) {
        self.recipe = recipe
        
        $recipe
        .map(\.id)
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
        
        $recipe
            .map(\.title)
            .assign(to: \.title, on: self)
        .store(in: &cancellables)
        
        //TODO: store color

        
        
        
    }
    
}
