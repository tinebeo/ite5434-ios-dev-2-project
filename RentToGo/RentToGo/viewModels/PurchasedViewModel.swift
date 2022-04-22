//
//  PurchasedViewModel.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-04-22.
//

import Foundation
import Firebase

class PurchasedViewModel: ObservableObject {
    @Published var purchasedItems = [Purchased]()
    

    
    func addData(purchasedItem: Purchased) {
        let db = Firestore.firestore()
        
        db.collection("purchased").addDocument(data: ["owner": purchasedItem.owner, "productIds": purchasedItem.productIds, "address": purchasedItem.address, "totalPrice": purchasedItem.totalPrice, "dropOffDate": purchasedItem.dropOffDate]){ error in
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
        db.collection("purchased").getDocuments { snapshot, error in
            if error == nil {
                //No errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.purchasedItems = snapshot.documents.map { d in
                            
                            //Create product for each document
                            return Purchased(id: d.documentID, owner: d["owner"] as? String ?? "", productIds: d["productIds"] as? [String] ?? [""], address: d["address"] as? String ?? "", totalPrice: d["totalPrice"] as? Double ?? 0, dropOffDate: d["dropOffDate"] as? Date ?? Date())
                        }
                    }
                }
            } else {
                
            }
        }
        
    }
}
