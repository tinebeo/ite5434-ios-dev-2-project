//
//  PaymentConfig.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-04-21.
//

import Foundation

class PaymentConfig {
    
    var paymentIntentClientSecret: String?
    static var shared: PaymentConfig = PaymentConfig()
    
    private init() { }
}
