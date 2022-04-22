//
//  MyItemsAddView.swift
//  RentToGo
//
//  Created by Михаил Пак on 22.03.2022.
//

import SwiftUI

struct MyItemsAddView: View {
    @StateObject var currentProducts : CurrentProducts

    @State var name : String = ""
    @State var price : String = ""
    @State var description : String = ""
    @State var quantity : String = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button{
                
            } label: {
                Image("uploadImage")
            }
            Spacer()
            VStack(alignment: .leading, spacing: 0){
                Text("Name")
                    .padding(.leading, 15)
                TextField("Enter name", text: $name)
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
//                let newProduct = Product(name, NSString(string: price).doubleValue, description, NSString(string: quantity).integerValue, false)
//                currentProducts.products.append(newProduct)
                name = ""
                price = ""
                description = ""
                quantity = ""
                showingAlert = true
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
        .padding(.top, 95)
        .padding([.top, .bottom], 40)
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
