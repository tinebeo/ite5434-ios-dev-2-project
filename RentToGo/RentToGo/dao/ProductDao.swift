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
        
        addProduct(Product("test", 2.0, "test desc", 1, true))
    }
    
    func addProduct(_ product: Product){
    
        ref.childByAutoId().setValue(product.getDictionary())
    }
    
    
}
