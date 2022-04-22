//
//  CartView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI
import FirebaseAuth

struct CartView: View {
    
    @State var currenTab: Int = 0
    @ObservedObject var model = PurchasedViewModel()
    @ObservedObject var model2 = ProductViewModel()
    var history = History()
    let user = Auth.auth().currentUser

    func findAllPurchased() {
        
        for item in model.purchasedItems {
            if item.owner == user?.uid {
                        for ids in item.productIds {
                            for product in model2.products {
                                if (product.id == ids) {
                                    history.addToTheHistory(product)
                                }
                            }
                        }
                    }
                }
    }
    
    
    var body: some View {

        NavigationView {
            ZStack(alignment: .top) {
                TabView(selection: self.$currenTab) {
                        CartItemView().tag(0)
                            CartHistoryView().environmentObject(history).tag(1)
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .edgesIgnoringSafeArea(.all)
                        
                TabBarView(currentTab: self.$currenTab)
                    }
        }.onAppear{
            model.getData()
            model2.getData()
            findAllPurchased()
        }
        .navigationViewStyle(.stack)
    }
    
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    var tabBarOptions: [String] = ["Cart", "History"]
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

struct TabBarItem: View {
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
