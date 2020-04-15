//
//  Calendar.swift
//  LazyPlanner
//
//  Created by Ling Ma on 4/1/20.
//  Copyright © 2020 Stephanie Le, Ling Ma. All rights reserved.
//

import SwiftUI
import Firebase
import Foundation

struct MyCalendar: View {
    @ObservedObject var weekVM = WeekViewModel()
    
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<weekVM.dayCellViewModels.count){ i in
                    VStack{
                        Text("\(i+1)")
                        DayCell(dayCellVM: self.weekVM.dayCellViewModels[i]).frame(width: CGFloat(50), height: CGFloat(300))
                    }
                }
            }
            Spacer()
            Text("Recipe Select Section")
        }
    }
}

struct MyCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendar()
    }
}


