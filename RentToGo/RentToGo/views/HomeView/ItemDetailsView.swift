//
//  ItemDetailsView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-19.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @Binding var searchText: String
    let btnColor : Color = Color(UIColor(red: 1.0, green: 232.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0))
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                
                // Search bar
                // https://blckbirds.com/post/how-to-create-a-search-bar-with-swiftui/
                ZStack {
                    Rectangle().foregroundColor(.white)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        //TextField("Search ..", text: nil)
                        TextField("Search...", text: $searchText)
                    }
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                }
                    .frame(height: 40)
                    .border(Color.gray)
                    .cornerRadius(15)
                    .padding(10)
                    .padding(.top, 80)
                    .background(themeColor)
                
                // Product details
                ItemDetailsProductView()
                
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
            // Checkout
            Text("In stock/Out of stock status").padding(.leading, 10)
            HStack {
                Spacer()
                Button(action: {
                        print("Add to cart tapped")
                    }) {
                        Text("Add to Cart")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15).stroke(btnColor, lineWidth: 2)
                        )
                    }
                    .background(Color.yellow) // If you have this
                    .cornerRadius(25)
                Spacer()
            }.frame(alignment: .bottom)
            
        }.edgesIgnoringSafeArea(.top)
        
    }
}

struct ItemDetailsProductView : View {
    
    var body: some View {
        // Product Details
        VStack(alignment: .leading) {
            
            Text("Product Name").font(.system(size: 20)).padding(.leading, 10)
            
            HStack {
                Spacer()
                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 300.0, height: 300.0)
                Spacer()
            }
            
            Text("$XXX.XX").font(.system(size: 20)).padding(.leading, 10)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.").font(.system(size: 14)).padding(.leading, 10)
            
            Spacer()
            Spacer()
            Spacer()
            
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(searchText: .constant(""))
    }
}
