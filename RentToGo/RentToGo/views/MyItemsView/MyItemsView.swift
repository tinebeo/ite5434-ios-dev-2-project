//
//  MyItemsView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

class HistoryProducts: ObservableObject {
    @Published var products: [Product] = [
//        Product("Bike", 200, "Very cool product", 1, false, owner: "tim", "tim"),
       
    ]
}

class CurrentProducts: ObservableObject {
    @Published var products: [Product] = [
//        Product("Bike", 200, "Very cool product", 1, false, owner: "tim", "tim"),
    ]
}

struct MyItemsView: View {
    @State var currentTab: Int = 0
    @StateObject var model = ProductViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab) {
                MyItems().environmentObject(model).tag(0)
                MyItemsHistoryView().tag(1)
                MyItemsAddView().environmentObject(model).tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            ItemsTabBarView(currentTab: self.$currentTab)
        }.onAppear{model.getData()}
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
