//
//  CartItemView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI

struct CartItemView: View {
    
        @EnvironmentObject private var cart: Cart
      @State private var isActive: Bool = false
      
      private func startCheckout(completion: @escaping (String?) -> Void) {
         
          let url = URL(string: "https://android-rentogo.herokuapp.com/create-payment-intent")!

          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          request.httpBody = try! JSONEncoder().encode(cart.items)
          
          URLSession.shared.dataTask(with: request) { data, response, error in
                  
              guard let data = data, error == nil,
                    (response as? HTTPURLResponse)?.statusCode == 200
              else {
                  completion(nil)
                  return
              }
              
              let checkoutIntentResponse = try? JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
              completion(checkoutIntentResponse?.clientSecret)

          }.resume()
          
      }
    
    var body: some View {
        VStack {
            List(0..<4) { item in
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
        
//            NavigationLink(destination: RentalSummaryView()) {
//                Image("checkoutBtn")
//            }
//
            NavigationLink(isActive: $isActive) {
                               RentalSummaryView()
                           } label: {
                               Button("Checkout") {
                                   startCheckout { clientSecret in
                                       cart.addToCart(Product("tim", "tim", 2, "tim", 2, false, owner: "tim", "tim", "tim"))
                                       PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                                       
                                       DispatchQueue.main.async {
                                           isActive = true
                                       }
                                   }
                               }
                           }
            
            Spacer()
        }
    }
}
