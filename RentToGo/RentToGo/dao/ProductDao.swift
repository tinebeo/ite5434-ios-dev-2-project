//
//  ProductDao.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-04-21.
//
//
//  ProductDao.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-04-21.
//

import Foundation
import Firebase

class ProductDao {
    
    var ref = Database.database().reference().child("Product")
    
    init() {
        
        /*ref.childByAutoId().setValue([
            "test": "hello"
        ])*/
        
        addProduct(Product("tim", "tim", 2, "tim", 2, false, owner: "tim", "tim", "tim"))
    }
    
    func addProduct(_ product: Product){
    
        ref.child(product.id).setValue(product.getDictionary())
    }
    
    
}
