import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searches = [Search]()
    @Published var searchResults = [Product]()
    //@Published var searchItemSpecific = Product
    
    func addData(userId: String, searchString: String) {

        // Get a reference to the database
        let db = Firestore.firestore()

        // Add a document to a collection
        db.collection("search").addDocument(data: ["userId":userId, "searchString":searchString])
    }

    func getData() {
        let db = Firestore.firestore()

        db.collection("search").getDocuments { snapshot, error in
            if error == nil {

                if let snapshot = snapshot {

                    // Update the list property in the main thread
                    DispatchQueue.main.async {

                        // Get all sea documents and create Todos
                        self.searches = snapshot.documents.map { d in

                            // Create a Todo item for each document returned
                            return Search(userId: d["userId"] as? String ?? "",
                                          searchString: d["searchString"] as? String ?? "")
                        }
                    }


                }
            }
            else {
                // Handle the error
            }
        }
    }

    func getSearchResults(searchText : String) {

        let db = Firestore.firestore()
        @Binding var searchText : String

        db.collection("product").getDocuments { snapshot, error in
            if error == nil {
                //No errors
                if let snapshot = snapshot {

                    DispatchQueue.main.async {
                        self.searchResults = snapshot.documents.map { d in

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

    /*func getProductById(productId: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("product").document(productId).getDocument { snapshot, error in
            if error == nil {
                //No errors
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.searchItemSpecific = snapshot.documents.map { d in
                            
                            
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
    }*/
}
