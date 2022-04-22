//
//  MyItemsAddView.swift
//  RentToGo
//
//  Created by Михаил Пак on 22.03.2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

struct MyItemsAddView: View {
    @EnvironmentObject var model: ProductViewModel
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    @State var name : String = ""
    @State var category : String = ""
    @State var price : String = ""
    @State var description : String = ""
    @State var quantity : String = ""
    @State private var showingAlert = false
    @State private var validationAlert = false
    
    var body: some View {
        VStack {
            Button{
                isPickerShowing = true
            } label: {
                if selectedImage != nil{
                    Image(uiImage: selectedImage!).resizable().frame(width: 200, height: 200)
                } else {
                    Image("uploadImage")
                }
            }
            Spacer()
            VStack(alignment: .leading, spacing: 0){
                Text("Name")
                    .padding(.leading, 15)
                TextField("Enter name", text: $name)
                    .padding(15)
                    .textFieldStyle(BottomLineTextFieldStyle())
                Text("Category")
                    .padding(.leading, 15)
                TextField("Enter category", text: $category)
                    .padding(15)
                    .textFieldStyle(BottomLineTextFieldStyle())
                Text("Price")
                    .padding(.leading, 15)
                TextField("Enter price", text: $price)
                    .padding(15)
                    .textFieldStyle(BottomLineTextFieldStyle())
                Text("Description")
                    .padding(.leading, 15)
                TextField("Enter description", text: $description)
                    .padding(15)
                    .textFieldStyle(BottomLineTextFieldStyle())
                Text("Quantity")
                    .padding(.leading, 15)
                TextField("Enter quantity", text: $quantity)
                    .padding(15)
                    .textFieldStyle(BottomLineTextFieldStyle())
            }.padding([.trailing, .leading], 10)
            Spacer()
            Button{
                uploadPhoto()
            } label: {
                Image("addItemBtn")
                    .resizable()
                    .frame(width: 310, height: 50.0)
            }
        }
        .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Product added successfully")
                    )
                }.padding()
        .alert(isPresented: $validationAlert) {
                    Alert(
                        title: Text("Fill the product information")
                    )
                }.padding()
        .padding(.top, 95)
        .padding([.top, .bottom], 40)
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            ImagePicker(selecredImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
    
    func uploadPhoto() {
        guard selectedImage != nil else {
            validationAlert = true
            return
        }
        
        if name == "" || category == "" ||
        price == "" || quantity == "" || description == "" {
            validationAlert = true
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
       
        guard imageData != nil else {
            return
        }
        
        let path = "products/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        _ = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            if error == nil && metadata != nil {
//                let db = Firestore.firestore()
//                db.collection("product").document(product.id).setData(["imageUrl": path])
                fileRef.downloadURL { url, error in
                    if error == nil {
                        let product = Product(UUID().uuidString, name, Double(price) ?? 0, description, Int(quantity) ?? 0, false, owner: "Max", category, url?.absoluteString ?? "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc=")
                        model.addData(product: product)
                        name = ""
                        category = ""
                        price = ""
                        description = ""
                        quantity = ""
                        showingAlert = true
                        selectedImage = nil
                    }
                }
            }
        }
        
    }
}
struct BottomLineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            configuration
            Rectangle()
                .frame(height: 0.5, alignment: .bottom)
                .foregroundColor(.black)
        }
    }
}
struct MyItemsAddView_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsView()
    }
}
