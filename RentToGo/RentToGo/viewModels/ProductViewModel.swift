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
    
    func addData(_ name: String, _ category: String, _ description: String, _ owner: String, isRented: Bool, price: Double, quantity: Int, _ imageURL: String) {
        let db = Firestore.firestore()
        db.collection("product").addDocument(data: ["name": name, "category": category, "description": description, "owner": owner, "isRented": isRented, "price": price, "quantity": quantity, "imageURL": imageURL]) { error in
            if error == nil {
                self.getData()
            } else {
                
            }
        }
    }
    
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
                                           d["imageUrl"] as? String ?? "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc=")
                        }
                    }
                }
            } else {
                
            }
        }
        
    }
}
