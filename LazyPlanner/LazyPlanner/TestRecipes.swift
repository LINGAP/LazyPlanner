//
//  TestRecipe.swift
//  LazyPlanner
//
//  Created by vodkachamber on 3/10/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import Foundation
import SwiftUI
import Siesta

struct TestRecipes: Codable {
    var testRecipes: [TestRecipe]
}

struct TestRecipe: Codable {
    var id: Int
    var title: String
}

struct ContentView: View {
    @State var testRecipes = [TestRecipe]()
    var body: some View {
        List(testRecipes, id: \.id){ testRecipe in
            VStack(alignment: .leading) {
                Text(testRecipe.title)
                    .font(.headline)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData()  {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/random?number=3&apiKey=56cf9661e8104e9089c6fd4bb8f82dad") else {
            print("invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                if let decodedResponse = try? JSONDecoder().decode(TestRecipes.self, from: data){
                    DispatchQueue.main.async{
                        print("succeed!")
                        self.testRecipes = decodedResponse.testRecipes
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
