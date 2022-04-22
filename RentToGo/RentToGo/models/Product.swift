//
//  Product.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import Foundation

struct Product : Identifiable, Hashable, Codable {
    var id: String
    var name : String
    var price : Double
    var description : String
    var quantity : Int
    var isReturned : Bool
    var owner : String?
    var category : String?
    var imageUrl : String?

    
    init(_ id: String, _ name: String, _ price: Double, _ description: String, _ quantity: Int, _ isReturned: Bool, owner : String?, _ category : String?, _ imageUrl: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.quantity = quantity
        self.isReturned = isReturned
        self.owner = owner
        self.category = category
        self.imageUrl = imageUrl
    }
    
    func getDictionary() -> Dictionary<String, Any> {
        
        var dict = [
            "id" : id,
            "name": name,
            "price": price,
            "description": description,
            "quantity": quantity,
            "isReturned": false,
            "owner": owner,
            "category" : category,
            "imageUrl": imageUrl
        ] as [String : Any]
        
        return dict
    }
    
}
