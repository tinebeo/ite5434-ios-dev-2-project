//
//  HomeView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    
    @State var isSearching: Int? = nil
    
    @StateObject var homeModel = ProductViewModel()
    
    @ObservedObject private var viewModel = ProductViewModel()
    
    /*init() {
        model.getData()
    }*/
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                
                ScrollView {
                    
                    // Search
                    //NavigationLink(destination: PreSearchView(searchText: .constant("")), tag: 1, selection: $isSearching) {
                    NavigationLink(destination: PreSearchView(), tag: 1, selection: $isSearching) {
                        
                        Button(action: {
                            self.isSearching = 1
                            
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass").padding(10)
                                Spacer()
                            }
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(10)
                        .padding(.top, 50)
                        .foregroundColor(.gray)
                    }
                    
                    RentOfTheDayView().environmentObject(viewModel)
                    //RentOfTheDayView().environmentObject(homeModel)
                    
                    // Top Essentials
                    EssentialView().environmentObject(viewModel)
                    CategoriesView().environmentObject(viewModel)
                }
                .background(themeColor)
                .edgesIgnoringSafeArea(.top)
                .onAppear{viewModel.getData()}
                
            }
            .navigationBarHidden(true)
            
            
        }
        
    }
    
    
}

struct RentOfTheDayView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Rent of the Day
            Text("Rent of the Day").padding(.bottom).font(.system(size: 20)).padding(.leading, 10).padding(.top, 10)
            
            HStack {
                Spacer()
                if (self.viewModel.products.isEmpty) {
                    Button {
                        print("Hello")
                    } label: {
                        EmptyView()
                    }

                } else {
                    NavigationLink(destination: ItemDetailsView(product: viewModel.products[0])) {
                        if self.viewModel.products.isEmpty {
                            Image("photoPlaceholder").resizable().scaledToFit().frame(width: 150.0, height: 150.0)
                                    
                                    } else {
                                        Image("photoPlaceholder").data(url: viewModel.products[0].imageUrl ?? "photoPlaceholder").resizable().scaledToFit().frame(width: 150.0, height: 150.0)
                                    }
                    }
                }
                
               
                Spacer()
            }
            if self.viewModel.products.isEmpty {
                Text("").font(.system(size: 24)).padding(.leading, 10)
                Text("")
                
            } else {
                Text("$" + "\(String(format: "%.1f", self.viewModel.products[0].price))").font(.system(size: 24)).padding(.leading, 10)
                Text(self.viewModel.products[0].name)
                
            }
            
        }.onAppear(perform: {
            print(viewModel.products)
        })
        .background(Color.white)
    
        
        
        
        
    }
}

struct EssentialView: View {
    
    @State var label: String = "Essential Name"
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        // Top Essentials
        VStack(alignment: .leading) {
            
            Text("Essentials").font(.system(size: 20)).padding(.leading, 10).padding(.top, 10)
            
            if (viewModel.products.isEmpty) {
                EmptyView()
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        
                        ForEach(3..<6) { i in
                            VStack {
                                NavigationLink(destination: ItemDetailsView(product: viewModel.products[i])) {
                                    Image("photoPlaceholder").data(url: viewModel.products[i].imageUrl ?? "photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                                }
                                
                                Text(viewModel.products[i].name).font(.system(size: 14))
                            }
                        }
                        
                    }.padding(.leading, 10)
                }
            }
            
            
            
            
        }
        .background(Color.white)
        
    }
    
}

struct CategoriesView : View {
    
    @State var label: String = "Category Name"
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories").font(.system(size: 20)).padding(.leading, 10).padding(.top, 10)
            
            HomeHorizontalIconView(label: $label).environmentObject(viewModel)
            
        }
        .background(Color.white)
        
    }
}

struct HomeHorizontalIconView : View {
    
    @Binding var label: String
    let categories = [["Home", "https://contentgrid.homedepot-static.com/hdus/en_US/DTCCOMNEW/Articles/best-furniture-for-your-home-hero.jpg"],["Tech", "https://cdn.vox-cdn.com/thumbor/t-tqoncT0dIR_seOj5C6x4QWNYA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13707075/akrales_190117_3163_0194.jpg"],["Tools", "https://nationaltoday.com/wp-content/uploads/2021/10/Worship-of-Tools-Day.jpg"]]
    
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                // TODO this needs to loop through data
                ForEach(categories, id: \.self) { category in
                    VStack {
                        NavigationLink(destination: PostSearchView(searchText: category[0]).environmentObject(viewModel)) {
                            Image("photoPlaceholder").data(url: category[1] ?? "photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                       
                        Text(category[0]).font(.system(size: 14))
                    }
                }
                
            }.padding(.leading, 10)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
