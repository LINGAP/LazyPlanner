//
//  DayCell.swift
//  LazyPlanner
//
//  Created by Ling Ma on 3/29/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI

struct DayCell: View {
    let recipeLabels:[String] = ["r1111111111111111","r2","r3","r4"]
    @State private var editMode = EditMode.inactive
    var body: some View {
        VStack{
            Text("Sun")
    NavigationView{
        List(recipeLabels, id: \.self){ recipeLabel in
            Text(recipeLabel)
                .font(.headline)
        }.border(Color.Theme.grey,width: 5)
        .navigationBarTitle("List")
        
            // 3.
            .navigationBarItems(leading: EditButton(),trailing: addButton)
            // 4.
            .environment(\.editMode, $editMode)
            

    }
        }
        //.frame(maxWidth: 70,minHeight: 40)
    }
    
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    func onAdd() {
        // To be implemented in the next section
    }
}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell()
    }
}
