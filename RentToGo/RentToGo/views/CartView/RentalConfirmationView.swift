//
//  RentalSummaryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI

struct RentalConfirmationView: View {
    @State private var cardNumber: String = ""
    
    var body: some View {
        ScrollView {
        
            VStack(alignment: .center, spacing: 20, content: {
                Spacer()
                Spacer()
                Image("rentSign")
                Spacer()
                Text("Thank you for renting, XXXXXX!")
                Text("Remember to pick up and drop off on time!")
                Spacer()
                NavigationLink("Review Order History", destination: CartHistoryView())
                NavigationLink("Keep Renting", destination: CartView())
            })
        }
        
    }
}

struct RentalConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        RentalConfirmationView()
    }
}
