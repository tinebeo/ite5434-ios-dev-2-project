//
//  RentToGoApp.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI
import Firebase
import Stripe
import FirebaseAuth
//final class AppDelegate: NSObject, UIApplicationDelegate{
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
////        FirebaseApp.configure()
//        return true
//    }
//
//}

@main
struct RentToGoApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject var sessionService = SessionServiceImp()
    
    @StateObject var firestoreManager = ProductViewModel()
    
    init(){
        StripeAPI.defaultPublishableKey = "pk_test_51KeOQoLRE6j3B7vaxcTYB870BBGSPy7K6YeAZ4jhXnJl9w8D6VPMRcPRyDshfNOhQhrTNxbpss1wLh4abDUZlIFV00L8Dlk5fP"
        initFirebase()
        ProductDao()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                switch sessionService.state{
                case .loggedIn:
                    ContentView().environmentObject(sessionService)
                        .navigationBarHidden(true)
                        .edgesIgnoringSafeArea([.top, .bottom])
                case .loggedOut:
                     LoginView().navigationBarHidden(true)
                        .edgesIgnoringSafeArea([.top, .bottom])
                }
            }
        }
    }
}

func initFirebase(){
    FirebaseApp.configure()
    
}
