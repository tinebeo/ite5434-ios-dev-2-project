//
//  SearchView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct PostSearchView: View {
    
    @State var searchText: String
    @EnvironmentObject var viewModel: ProductViewModel
    
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
                    TextField("Search...", text: $searchText )
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
            
            Text("Results").font(.system(size: 20)).padding(.leading, 10)
            
            PostSearchHistoryView(searchText: $searchText).environmentObject(viewModel)
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.top)
        
    }
}

struct PostSearchHistoryView : View {
    
    let searchHistory = ["1", "2", "3", "4", "5"]
    @Binding var searchText: String
    @EnvironmentObject var viewModel: ProductViewModel
    
    
    var body: some View {
        // Search history
        List {
            if (viewModel.products.isEmpty) {
                EmptyView()
            } else {
                ForEach(viewModel.products.filter({ produc in
                    return produc.category == searchText
                })) { product in
                    NavigationLink(destination: ItemDetailsView(product: product)) {
                        HStack {
                                                    Image("photoPlaceholder").data(url: product.imageUrl!).resizable().scaledToFit().frame(width: 100.0, height: 130.0)
                                                    VStack(alignment: .leading) {
                                                        Text("\(product.name)")
                                                        Text("$" + "\(String(format: "%.1f", product.price))")
                        
                                                        Text(product.description).font(.system(size: 14))
                                                    }
                                                }
                    }
        
                }
            }
            
        }
        .listStyle(.plain)
        .onAppear{}
    }
}

struct PostSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PostSearchView(searchText: "")
    }
}
