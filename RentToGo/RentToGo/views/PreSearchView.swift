//
//  SearchView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct PreSearchView: View {
    
    @Binding var searchText: String
    let searchHistory = ["History 1", "History 2", "History 3", "History 4", "History 5"]
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    
    init(searchText: Binding<String>) {
        UINavigationBar.appearance().backgroundColor = .orange
        self._searchText = .constant("")
    }
    
    var body: some View {
        VStack {
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
            
            // Search history
            List {
                ForEach(searchHistory, id: \.self) { history in
                    Button(history, action: {}).font(.system(size: 14))
                }
            }
            .listStyle(.plain)
        
            
            Spacer()
        }
        
        
        
    }
}

struct PreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PreSearchView(searchText: .constant(""))
    }
}
