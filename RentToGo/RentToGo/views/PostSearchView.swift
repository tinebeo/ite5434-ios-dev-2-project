//
//  SearchView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct PostSearchView: View {
    
    @Binding var searchText: String
    let searchHistory = ["History 1", "History 2", "History 3", "History 4", "History 5"]
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    
    var body: some View {
        VStack(alignment: .leading) {
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
                .background(themeColor)
            
            Text("Results").font(.system(size: 20)).padding(.leading, 10)
            
            // Search history
            List {
                
                Button(action: {
                    print("Result pressed")
                    
                }) {
                    HStack {
                        Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text("Product Name")
                            Text("$XXX.XX")
                            
                            Text("Product Details").font(.system(size: 14))
                        }
                    }
                }
                
                Button(action: {
                    print("Result pressed")
                    
                }) {
                    HStack {
                        Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text("Product Name")
                            Text("$XXX.XX")
                            
                            Text("Product Details").font(.system(size: 14))
                        }
                    }
                }
                
                Button(action: {
                    print("Result pressed")
                    
                }) {
                    HStack {
                        Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text("Product Name")
                            Text("$XXX.XX")
                            
                            Text("Product Details").font(.system(size: 14))
                        }
                    }
                }
                
                
                
            }
            .listStyle(.plain)
        
            
            Spacer()
        }
        
        
        
    }
}

struct PostSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PostSearchView(searchText: .constant(""))
    }
}
