//
//  RentalSummaryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI
import Stripe

struct RentalSummaryView: View {
    @State private var cardNumber: String = ""
    @EnvironmentObject private var cart: Cart
    @State private var message: String = ""
    @State private var isSuccess: Bool = false
    @State private var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    
    private func pay() {
            
            guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
                return
            }
            
            let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
            paymentIntentParams.paymentMethodParams = paymentMethodParams
            
            paymentGatewayController.submitPayment(intent: paymentIntentParams) { status, intent, error in
                
                switch status {
                    case .failed:
                        message = "Failed"
                    case .canceled:
                        message = "Cancelled"
                    case .succeeded:
                        message = "Your payment has been successfully completed!"
                        isSuccess = true
                }
                
            }
            
        }
    
    
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
                HStack {
                                    Spacer()
                    Text("Total \(cart.cartTotal)")
                                    Spacer()
                                }
                                
                                Section {
                                    // Stripe Credit Card TextField Here
                                    STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
                                } header: {
                                    Text("Payment Information")
                                }
                                
                                HStack {
                                    Spacer()
                                    Button("Pay") {
                                        pay()
                                    }.buttonStyle(.plain)
                                    Spacer()
                                }
                                
                                
                
                
               
            }).padding(CGFloat(40))
            Text(message)
                .font(.headline)
            NavigationLink(isActive: $isSuccess, destination: {
                           RentalConfirmationView()
                       }, label: {
                           EmptyView()
                       })
        }
        
    }
}

struct RentalSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        RentalSummaryView()
    }
}
