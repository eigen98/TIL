//
//  MyFormViewController.swift
//  EurakaPractice
//
//  Created by JeongMin Ko on 2022/11/21.
//

import Foundation
import Eureka
class MyFormViewController: FormViewController {

    override func viewDidLoad() {
          super.viewDidLoad()
        self.tableView.separatorStyle = .none
          form +++ Section("Section1")
        <<< TextRow(){ row in
            row.title = "Text Row"
            row.placeholder = "Enter text here"
        }
        <<< TextRow(){ row in
            row.title = "Text Row"
            row.placeholder = "Enter text here"
        }
        <<< TextRow(){ row in
            row.title = "Text Row"
            row.placeholder = "Enter text here"
        }
        <<< TextRow(){ row in
            row.title = "Text Row"
            row.placeholder = "Enter text here"
        }
        <<< PhoneRow(){
            $0.title = "Phone Row"
            $0.placeholder = "And numbers here"
            
        }
          +++ Section("Section2")
              <<< DateRow(){
                  $0.title = "Date Row"
                  $0.value = Date(timeIntervalSinceReferenceDate: 0)
              }
        
        // Enables the navigation accessory and stops navigation when a disabled row is encountered
            navigationOptions = RowNavigationOptions.Enabled.union(.StopDisabledRow)
            // Enables smooth scrolling on navigation to off-screen rows
            animateScroll = true
            // Leaves 20pt of space between the keyboard and the highlighted row after scrolling to an off screen row
            rowKeyboardSpacing = 20
        
      }
}
