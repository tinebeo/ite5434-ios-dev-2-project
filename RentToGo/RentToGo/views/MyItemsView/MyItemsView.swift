//
//  MyItemsView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

class HistoryProducts: ObservableObject {
    @Published var products: [Product] = [
        Product("Bike", 200, "Very cool product", 1, false),
        Product("Motorcycle", 2000, "The coolest bike", 1, true),
        Product("Car", 300, "Very cool car", 1, false),
        Product("Waterbike", 500, "The coolest bike", 1, true),
        Product("Tricycle", 870, "Very cool tricycle", 1, false),
        Product("Dirt bike", 900, "The coolest dirt bike", 1, true),
    ]
}

class CurrentProducts: ObservableObject {
    @Published var products: [Product] = [
        Product("Computer", 200, "Very cool product", 1, false),
        Product("Phone", 430, "The coolest phone", 1, true),
        Product("Chair", 250, "Very cool chair", 1, false),
        Product("Table", 100, "The coolest table", 1, true),
        Product("iPad", 60, "Very cool ipad", 1, false),
        Product("Bed", 80, "The coolest bed", 1, true),
    ]
}

struct MyItemsView: View {
    @StateObject var currentProducts = CurrentProducts()
    @StateObject var historyProducts = HistoryProducts()
    @State var currentTab: Int = 0
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab) {
                MyItems(currentProducts: currentProducts).tag(0)
                MyItemsHistoryView(historyProducts: historyProducts).tag(1)
                MyItemsAddView(currentProducts: currentProducts).tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            ItemsTabBarView(currentTab: self.$currentTab)
        }
    }
}

struct ItemsTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    var tabBarOptions: [String] = ["My Items", "History", "Add Item"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 46) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                    
                })
            }
            .padding(.horizontal)
        }
        .background(themeColor)
        .frame(height: 142)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ItemsTabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct MyItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsView()
    }
}
