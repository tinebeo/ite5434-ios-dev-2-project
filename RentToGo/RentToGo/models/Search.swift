//
//  Search.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-04-22.
//

import Foundation

class Search : Identifiable {

    var userId: String // user id
    var searchString : String // search text
    
    init(userId : String, searchString : String) {
        self.userId = userId
        self.searchString = searchString
    }
}
