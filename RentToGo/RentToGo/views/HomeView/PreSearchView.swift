//
//  SearchView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct PreSearchView: View {
    
    @State var searchText: String = ""
    @ObservedObject var model = SearchViewModel()
    
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    /*init(searchText: Binding<String>) {
        self._searchText = .constant("")
    }*/
    
    var body: some View {
        VStack {
            // Search bar
            // https://blckbirds.com/post/how-to-create-a-search-bar-with-swiftui/
            
                ZStack {
                Rectangle().foregroundColor(.white)
                HStack {
                    Image(systemName: "magnifyingglass")
                    //TextField("Search ..", text: nil)
                    TextField("", text: $searchText)
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
            
            
//            // navigate to post searches
//            NavigationLink(destination: PostSearchView(searchText: $searchText)) {
//                Button(action: {
//
//                    // Add search to search history
//                    if (searchText != "") {
//                        model.addData(userId: "christine", searchString: searchText)
//                    }
//
//
//                }, label: {
//                    Text("Search")
//                })
//
//            }
            
            
            PreSearchHistoryView()
            
            Spacer()
            
                
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct PreSearchHistoryView : View {
    
    //let searchHistory = ["History 1", "History 2", "History 3", "History 4", "History 5"]
    
    @ObservedObject var model = SearchViewModel()
    
    init() {
        model.getData()
    }
    
    var body : some View {
        // Search history

        List (model.searches) { search in
            
            NavigationLink(destination: PostSearchView(searchText: "")) {
                Button(search.searchString, action: {}).font(.system(size: 14))
            }
        }.listStyle(.plain)
    }
}

struct PreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        //PreSearchView(searchText: .constant(""))
        PreSearchView()
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
