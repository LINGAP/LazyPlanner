//
//  DragRecipe.swift
//  LazyPlanner
//
//  Created by vodkachamber on 5/6/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import MobileCoreServices

final class DragRecipe:NSObject,NSItemProviderWriting,NSItemProviderReading,Codable{
    let recipe:Recipe
    let title:String
    
    init(recipe:Recipe){
        self.recipe = recipe
        self.title = recipe.title
    }
    static var writableTypeIdentifiersForItemProvider: [String]{
        return [(kUTTypeData as String)]
    }
    static var readableTypeIdentifiersForItemProvider: [String]{
        return [(kUTTypeData as String)]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let progress = Progress(totalUnitCount: 100)
        do {
            let data = try JSONEncoder().encode(self)
            progress.completedUnitCount = 100
            completionHandler(data,nil)
        }
        catch {
            completionHandler(nil,error)
        }
        return progress
    }
    
    
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> DragRecipe {
        do {
            let subject = try JSONDecoder().decode(DragRecipe.self, from: data)
            return subject
        }
        catch{
            fatalError("\(error.localizedDescription)")
        }
    }
    
    
}

