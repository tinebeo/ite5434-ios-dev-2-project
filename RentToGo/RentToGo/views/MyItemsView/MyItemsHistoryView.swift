//
//  MyItemsHistoryView.swift
//  RentToGo
//
//  Created by Михаил Пак on 22.03.2022.
//

import SwiftUI
import FirebaseFirestore

struct MyItemsHistoryView: View {
    @EnvironmentObject var model: ProductViewModel

    var body: some View {
        VStack {
            List($model.products) { product in
                if !product.isRented.wrappedValue {
                    Button(action: {
                        print(product.isRented.wrappedValue)
                    }) {
                        HStack {
                            Image("photoPlaceholder").data(url: product.imageUrl.wrappedValue!).resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                            VStack(alignment: .leading) {
                                Text("\(product.name.wrappedValue) | \(product.category.wrappedValue ?? "")")
                                Text("\(String(format: "%.1f", product.price.wrappedValue))").font(.system(size: 14)).padding(.bottom, 1)
                                Text(product.description.wrappedValue).font(.system(size: 14))
                                LabeledCheckbox(isChecked: product.isRented, product: product)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            Spacer()
        }
        .padding(.top, 95)
    }
}

struct LabeledCheckbox: View {
  @Binding var isChecked: Bool
  @Binding var product: Product
    
  var body: some View {
    Button(action: {
        let db = Firestore.firestore()
        db.collection("product").document(product.id).setData(["name": product.name, "category": product.category, "description": product.description, "owner": product.owner, "isRented": true, "price": product.price, "quantity": product.quantity, "imageUrl": product.imageUrl])
        isChecked = true
    }) {
        Image(isChecked ? "returnedBtn2" : "returnedBtn")
    }
  }
}

struct MyItemsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsView()
    }
}
