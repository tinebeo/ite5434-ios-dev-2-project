//
//  RentalSummaryView.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-03-20.
//

import Foundation
import SwiftUI
import Stripe
import FirebaseAuth

struct RentalSummaryView: View {
    @State private var cardNumber: String = ""
    @EnvironmentObject private var cart: Cart
    @State private var message: String = ""
    @State private var isSuccess: Bool = false
    @State private var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    let today = Date()
    let dateFormatter = DateFormatter()
    @State private var dropOffDate = Date()
    @State private var address: String = ""
    @ObservedObject var model = PurchasedViewModel()
    @StateObject var model2 = ProductViewModel()
    let user = Auth.auth().currentUser

    
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
                        var productIds = [String]()
                        for var item in cart.items {
                            productIds.append(item.id)
                            item.isRented = true
                            model2.addData(product: item)
                        }
                    model.addData(purchasedItem: Purchased(id: UUID().uuidString, owner: user?.uid ?? "0", productIds: productIds, address: address, totalPrice: cart.cartTotal, dropOffDate: dropOffDate))
                        
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
                    Text("\(Calendar.current.date(byAdding: .day, value: 3, to: today)!)")
                }
                HStack {
                    DatePicker(selection: $dropOffDate, in: ...Date(), displayedComponents: .date) {
                                   Text("Select a drop off date")
                               }
                }
                HStack {
                    Text("Address")
                    Spacer()
                    TextField("Address", text: $address)
                }
                HStack {
                    Text("Subtotal")
                    Spacer()
                    Text("$" + "\(String(format: "%.1f", cart.cartTotal))")
                }
                HStack {
                    Text("Fee")
                    Spacer()
                    Text("$1.35")
                }
                Spacer()
                Spacer()
                HStack {
                                    Spacer()
                    Text("Total:$ \(String(format: "%.1f", (cart.cartTotal + 1.35)))")
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
                                    }.buttonStyle(.automatic)
                                    Spacer()
                                }
                                
                                
                
                
               
            }).padding(CGFloat(40))
            Text(message)
                .font(.headline)
            NavigationLink(isActive: $isSuccess, destination: {
                    RentalConfirmationView().environmentObject(cart)
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
