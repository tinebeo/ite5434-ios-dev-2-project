//
//  Product.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import Foundation

struct Product : Identifiable, Hashable  {
    var id = UUID().uuidString

    var name : String
    var price : Double
    var description : String
    var quantity : Int
    var isReturned : Bool
    
    init(_ name: String, _ price: Double, _ description: String, _ quantity: Int, _ isReturned: Bool) {
        self.name = name
        self.price = price
        self.description = description
        self.quantity = quantity
        self.isReturned = isReturned
    }
    
}
