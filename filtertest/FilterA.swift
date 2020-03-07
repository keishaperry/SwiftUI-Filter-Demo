//
//  FilterA.swift
//  filtertest
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Keisha Perry. All rights reserved.
//

import SwiftUI

struct FilterA: View {
     var firstnameletters = ["All", "A", "E", "T" ]
    @EnvironmentObject var filters: UserFilters

    @State var firstNameFilterIndex = 0

      var body: some View {
            NavigationView{
                VStack{
                    Text(self.filters.firstName)
                    Form{
                        Section{
                            Picker(selection: $firstNameFilterIndex.onChange(firstLetterChange), label: Text("Please choose a letter")) {
                               ForEach(0 ..< firstnameletters.count) {
                                    Text(self.firstnameletters[$0]).tag($0)
                               }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                        }


                    }
                    Text("Current selection: \(firstNameFilterIndex)").font(.caption)
                }
                .navigationBarTitle(Text("First name starts with:"))
            }
         }
      func firstLetterChange(_ tag: Int) {
          print("New value: \(firstnameletters[tag])")
        self.filters.firstName = firstnameletters[tag]
        print("Env object is: \(self.filters.firstName)")

      }
    
}
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}
struct FilterA_Previews: PreviewProvider {
    static var previews: some View {
        FilterA()
    }
}
