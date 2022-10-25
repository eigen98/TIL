//
//  SecondView.swift
//  ObservableDemo
//
//  Created by JeongMin Ko on 2022/10/24.
//

import Foundation
import SwiftUI

struct SecondView : View{
   // @ObservedObject var timerData : TimerData
    @EnvironmentObject var timerData : TimerData
    
    var body : some View{
        VStack{
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}
