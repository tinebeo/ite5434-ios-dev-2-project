//
//  CartHistoryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI

struct CartHistoryView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 45)
            List(0..<2) { item in
                Button(action: {
                    print("Result pressed")
                    
                }) {
                    HStack {
                        Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text("Product Name")
                            Text("$XXX.XX")
                            
                            Text("Product Details").font(.system(size: 14))
                        }
                    }
                }
                
            }
            .listStyle(.plain)
        
            
            Spacer()
        }
    }
}
