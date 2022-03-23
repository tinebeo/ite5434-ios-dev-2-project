//
//  MyItems.swift
//  RentToGo
//
//  Created by Михаил Пак on 22.03.2022.
//

import SwiftUI

struct MyItems: View {
    @StateObject var currentProducts : CurrentProducts

    var body: some View {
        VStack {
            List($currentProducts.products) { product in
                Button(action: {
                    print("Result pressed")
                }) {
                    HStack {
                        Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text(product.name.wrappedValue)
                            Text("\(String(format: "%.1f", product.price.wrappedValue))")
                            Text(product.description.wrappedValue).font(.system(size: 14))
                        }
                        Spacer()
                        Button {
                            if let idx = currentProducts.products.firstIndex(where: { $0.id == product.wrappedValue.id }) {
                                currentProducts.products.remove(at: idx)
                            }
                        } label: {
                            Image("deleteBtn")
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

struct MyItems_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsView()
    }
}
