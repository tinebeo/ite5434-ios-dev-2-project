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
    //var owner : String?
    //var category : String?
    
    
    init(_ name: String, _ price: Double, _ description: String, _ quantity: Int, _ isReturned: Bool) {
        //_ owner : String?, _ category : String?
        self.name = name
        self.price = price
        self.description = description
        self.quantity = quantity
        self.isReturned = isReturned
        //self.owner = owner
        //self.category = category
        
    }
    
    func getDictionary() -> Dictionary<String, Any> {
        
        var dict = [
            "id" : id,
            "name": name,
            "price": price,
            "description": description,
            "quantity": quantity,
            "isReturned": false
            //"owner": owner,
            //"category" : category
            
        ] as [String : Any]
        
        return dict
    }
    
}
