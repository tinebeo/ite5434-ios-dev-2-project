//
//  ContentView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CartView()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }
            
            MyItemsView()
                .tabItem{
                    Image(systemName: "folder")
                    Text("My Items")
                }
            
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
