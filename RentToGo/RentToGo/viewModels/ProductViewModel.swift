//
//  ProductViewModel.swift
//  RentToGo
//
//  Created by Михаил Пак on 21.04.2022.
//

import Foundation
import Firebase
import FirebaseFirestore

class ProductViewModel: ObservableObject {
    @Published var products = [Product]()
    
    func getData() {
        //Get a ref to DB
        let db = Firestore.firestore()
        //Read the documents at a specific path
        db.collection("product").getDocuments { snapshot, error in
            if error == nil {
                //No errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.products = snapshot.documents.map { d in
                            
                            //Create product for each document
                            return Product(d.documentID,
                                           d["name"] as? String ?? "",
                                           d["price"] as? Double ?? 0,
                                           d["description"] as? String ?? "",
                                           d["quantity"] as? Int ?? 0,
                                           d["isReturned"] as? Bool ?? false,
                                           owner: d["owner"] as? String ?? "",
                                           d["category"] as? String ?? "",
                                           d["imageUrl"] as? String ?? "")
                        }
                    }
                }
            } else {
                
            }
        }
        
    }
}
