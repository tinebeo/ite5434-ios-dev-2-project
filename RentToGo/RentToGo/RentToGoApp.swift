//
//  RentToGoApp.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI
import Firebase

@main
struct RentToGoApp: App {
    
    init(){
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
