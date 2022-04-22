//
//  RentalSummaryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct RentalConfirmationView: View {
    
    @State private var cardNumber: String = ""
    @EnvironmentObject private var cart: Cart
    let user = Auth.auth().currentUser


    var body: some View {
        ScrollView {
        
            VStack(alignment: .center, spacing: 20, content: {
                Spacer()
                Spacer()
                Image("rentSign")
                Spacer()
                Text("Thank you for renting!")
                Text("Remember to pick up and drop off on time!")
                Spacer()
                NavigationLink("Keep Renting", destination: CartView())
            })
        }.onAppear {
            cart.deleteCart()
        }
        
    }
}

struct RentalConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        RentalConfirmationView()
    }
}
