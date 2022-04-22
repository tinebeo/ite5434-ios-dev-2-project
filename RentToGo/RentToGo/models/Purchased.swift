//
//  Purchased.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-04-22.
//

import Foundation

struct Purchased: Identifiable {
    
    var id: String
    var owner: String
    var productIds: [String]
    var address: String
    var totalPrice: Double
    var dropOffDate: Date
    
}
