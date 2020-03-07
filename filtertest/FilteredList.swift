//
//  FilteredList.swift
//  filtertest
//
//  Created by Keisha Perry on 3/3/20.
//  Copyright © 2020 Keisha Perry. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }

    var body: some View {
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    init(firstNameFilter: String, lastNameFilter: String) {
        
        print("First name filter: \(firstNameFilter)")
        print("Last name filter: \(lastNameFilter)")
        
        if (firstNameFilter.count > 0 && lastNameFilter.count > 0){
            var predicate = NSPredicate(format: "lastName BEGINSWITH %@ AND firstName BEGINSWITH %@", lastNameFilter, firstNameFilter)
            fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: predicate)

        } else if (firstNameFilter.count > 0 && lastNameFilter.count <= 0){
            var predicate = NSPredicate(format: "firstName BEGINSWITH %@", firstNameFilter)
            fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: predicate)
        } else if (firstNameFilter.count <= 0 && lastNameFilter.count > 0){
            var predicate = NSPredicate(format: "lastName BEGINSWITH %@", lastNameFilter)
            fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: predicate)
        } else {
            fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [])

        }
    

        

          //var predicate = NSCompoundPredicate(type:.and, subpredicates:[
            //    NSPredicate(format: "lastName BEGINSWITH %@", lastNameFilter),
            //    NSPredicate(format: "firstName BEGINSWITH %@", firstNameFilter)])
        //            var predicate = NSPredicate(format: "lastName BEGINSWITH %@", lastNameFilter)

        
        print(fetchRequest)
    }
}


