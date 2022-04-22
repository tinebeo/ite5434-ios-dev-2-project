//
//  RentToGoApp.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI
import Firebase
import FirebaseAuth
final class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}

@main
struct RentToGoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var sessionService = SessionServiceImp()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                
                switch sessionService.state{
                case .loggedIn:
                    ContentView().environmentObject(sessionService)
                case .loggedOut:
                     LoginView()
            }
            }
            
        }
    }
}
