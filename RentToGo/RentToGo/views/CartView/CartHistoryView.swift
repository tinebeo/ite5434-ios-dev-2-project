//
//  CartHistoryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI

struct CartHistoryView: View {
    
    @EnvironmentObject var items: History
    
//    var items = [Product]()
//
//    init() {
//
//        for item in model.purchasedItems {
//            print(item)
//            if item.owner == "jack" {
//                for ids in item.productIds {
//                    for product in model2.products {
//                        if (product.id == ids) {
//                            items.append(product)
//                        }
//                    }
//                }
//            }
//        }
//    }
    var body: some View {
        VStack {
            Spacer(minLength: 45)
            List(items.items.sorted(by: {$0.id < $1.id})) { item in
                Button(action: {
                    print("Result pressed")
                    
                }) {
                    HStack {
                        Image("photoPlaceholder").data(url: item.imageUrl ?? "photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text("$" + "\(String(format: "%.1f", item.price))")
                            
                            Text("\(item.description)").font(.system(size: 14))
                        }
                    }
                }
                
            }
            .listStyle(.plain)
        
            
            Spacer()
        }.onAppear {
            print(items.items)
        }
    }
}

