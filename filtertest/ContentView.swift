//
//  ContentView.swift
//  filtertest
//
//  Created by Keisha Perry on 3/3/20.
//  Copyright © 2020 Keisha Perry. All rights reserved.
//

import SwiftUI
class UserFilters: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
}
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var filters: UserFilters

    @State private var showingFirstNameFilter = false
    @State private var showingLastNameFilter = false

    var body: some View {
        VStack {
            FilteredList(firstNameFilter: self.filters.firstName, lastNameFilter: self.filters.lastName)
            
            ZStack{

                HStack(alignment: .center, spacing: 60){
                Button(action: { self.showingFirstNameFilter = true }) {
                    Text("First Name")
                        .padding(2)
                        .padding(.leading,40)
                        .font(.caption)
                        .foregroundColor(.white)
                    }.sheet(isPresented: $showingFirstNameFilter) {
                        FilterA()
                        .modifier(SystemServices())
                    }
                Button(action: { self.showingLastNameFilter = true }) {
                    Text("Last Name")
                        .foregroundColor(.white)
                        .padding(2)
                        .padding(.trailing,40)
                        .font(.caption)
                    }.sheet(isPresented: $showingLastNameFilter) {
                        FilterB()
                        .modifier(SystemServices())
                    }
//                Button(action: { self.showingImagePicker = true }) {
//                    Text("Show All")
//                        .foregroundColor(.white)
//                        .padding(2)
//                        .font(.caption)
//                    }.sheet(isPresented: $showingImagePicker) {
//                        ImagePicker()
//                    }
            }
            .padding(8)
                .background(Color.secondary)
                .cornerRadius(40)
            }

        }
            
        }
       
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
