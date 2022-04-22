//
//  RentToGoApp.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI
import Firebase
import Stripe

@main
struct RentToGoApp: App {
    
    @StateObject var firestoreManager = ProductViewModel()
    
    init(){
        StripeAPI.defaultPublishableKey = "pk_test_51KeOQoLRE6j3B7vaxcTYB870BBGSPy7K6YeAZ4jhXnJl9w8D6VPMRcPRyDshfNOhQhrTNxbpss1wLh4abDUZlIFV00L8Dlk5fP"
        initFirebase()
        ProductDao()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func initFirebase(){
    FirebaseApp.configure()
    
}
