//
//  FilterA.swift
//  filtertest
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Keisha Perry. All rights reserved.
//

import SwiftUI

struct FilterB: View {
     var lastnameletters = ["All", "A", "S" ]
    @EnvironmentObject var filters: UserFilters

    @State var lastNameFilterIndex = 0

      var body: some View {
            NavigationView{
                VStack{
                    Text(self.filters.lastName)
                    Form{
                        Section{
                            Picker(selection: $lastNameFilterIndex.onChange(lastLetterChange), label: Text("Please choose a letter")) {
                               ForEach(0 ..< lastnameletters.count) {
                                    Text(self.lastnameletters[$0]).tag($0)
                               }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                        }


                    }
                    Text("Current selection: \(lastNameFilterIndex)").font(.caption)
                }
                .navigationBarTitle(Text("First name starts with:"))
            }
         }
      func lastLetterChange(_ tag: Int) {
          print("New value: \(lastnameletters[tag])")
        self.filters.lastName = lastnameletters[tag]
        print("Env object is: \(self.filters.lastName)")

      }
    
}

struct FilterB_Previews: PreviewProvider {
    static var previews: some View {
        FilterA()
    }
}
