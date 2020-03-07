//
//  TabBar.swift
//  filtertest
//
//  Created by Keisha Perry on 3/7/20.
//  Copyright © 2020 Keisha Perry. All rights reserved.
//

import SwiftUI

struct TabBar: View {
       @State private var favoriteColor = 0
         var colors = ["Red", "Green", "Blue"]

         var body: some View {
             VStack {
                 Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                     ForEach(0..<colors.count) { index in
                         Text(self.colors[index]).tag(index)
                     }
                 }.pickerStyle(SegmentedPickerStyle())

                 Text("Value: \(colors[favoriteColor])")
             }
         }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
