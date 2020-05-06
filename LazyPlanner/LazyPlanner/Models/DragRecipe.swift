//
//  DragRecipe.swift
//  LazyPlanner
//
//  Created by Ling Ma on 5/5/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation

import UIKit
import MobileCoreServices

final class DragRecipeData: NSObject, Codable, NSItemProviderReading, NSItemProviderWriting {
    var recipe:Recipe
    
    init(recipe:Recipe) {
        self.recipe = recipe
    }
   
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData) as String]
    }
    
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData) as String]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let progress = Progress(totalUnitCount: 100)
        do {
            let data = try JSONEncoder().encode(self)
            progress.completedUnitCount = 100
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }
        return progress
    }

    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> DragRecipeData {
        let decoder = JSONDecoder()
        do {
            let myJSON = try decoder.decode(DragRecipeData.self, from: data)
            return myJSON
        } catch {
            fatalError("\(error.localizedDescription)")
        }
        
    }
    
   
    
}

