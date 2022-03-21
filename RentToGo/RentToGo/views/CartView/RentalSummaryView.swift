//
//  RentalSummaryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI

struct RentalSummaryView: View {
    @State private var cardNumber: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20, content: {
                HStack {
                    Text("Pickup date")
                    Spacer()
                    Text("MM/DD/YYYY HH:MM")
                }
                HStack {
                    Text("Drop off date")
                    Spacer()
                    Text("MM/DD/YYYY HH:MM")
                }
                HStack {
                    Text("Address")
                    Spacer()
                    Text("123 Street, City, Province, Postal")
                }
                HStack {
                    Text("Subtotal")
                    Spacer()
                    Text("$XXX.XX")
                }
                HStack {
                    Text("Tax")
                    Spacer()
                    Text("$XX.X")
                }
                Spacer()
                Spacer()
                Text("Total Price")
                VStack(alignment: .leading, spacing: 20) {
                    VStack {
                        Text("Card Number")
                        TextField("Card Number", text: self.$cardNumber)
                            .frame(width: 380, height: 60, alignment: .leading).background(Color(red: 243/255, green: 243/255, blue: 243/255))
                    }
                    VStack {
                        HStack(spacing:24) {
                            VStack {
                                Text("Valid Until")
                                TextField("Valid Until", text: self.$cardNumber)
                                    .frame(width: 178, height: 60, alignment: .leading).background(Color(red: 243/255, green: 243/255, blue: 243/255))
                            }
                            VStack {
                                Text("CVV")
                                TextField("CVV", text: self.$cardNumber)
                                    .frame(width: 178, height: 60, alignment: .leading).background(Color(red: 243/255, green: 243/255, blue: 243/255))
                            }
                        }
                    }
                    VStack {
                        Text("Card holder")
                        TextField("Card holder", text: self.$cardNumber)
                            .frame(width: 380, height: 60, alignment: .leading).background(Color(red: 243/255, green: 243/255, blue: 243/255))
                    }
                }
                
                NavigationLink(destination: RentalConfirmationView()) {
                    Image("paynowBtn")
                }
            }).padding(CGFloat(40))
        }
        
    }
}

struct RentalSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        RentalSummaryView()
    }
}
