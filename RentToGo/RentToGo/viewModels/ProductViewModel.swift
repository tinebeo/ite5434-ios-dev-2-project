//
//  ProductViewModel.swift
//  RentToGo
//
//  Created by Михаил Пак on 21.04.2022.
//

import Foundation
import Firebase

class ProductViewModel: ObservableObject {
    @Published var product: Product = Product("Table", 123, "Desc", 1, true, owner: "me", "Furniture")
    
    private var db = Firebase.stor.firestore()
}
