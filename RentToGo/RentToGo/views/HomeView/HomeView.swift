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
    //@EnvironmentObject var homeProducts: ProductViewModel
    
    /*init() {
        model.getData()
    }*/
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                
                ScrollView {
                    
                    // Search
                    NavigationLink(destination: PreSearchView(searchText: .constant("")), tag: 1, selection: $isSearching) {
                        
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
                    
                    RentOfTheDayView()
                    //RentOfTheDayView().environmentObject(homeModel)
                    
                    // Top Essentials
                    EssentialView().environmentObject(homeModel)
                    CategoriesView()
                }
                .background(themeColor)
                .edgesIgnoringSafeArea(.top)
                .onAppear{homeModel.getData()}
                
            }
            .navigationBarHidden(true)
            
            
        }
        
    }
    
    
}

struct RentOfTheDayView: View {
    //@EnvironmentObject var model: ProductViewModel
    
    //@Binding var products : [Product]
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Rent of the Day
            Text("Rent of the Day").padding(.bottom).font(.system(size: 20)).padding(.leading, 10).padding(.top, 10)
            
            HStack {
                Spacer()
                Button(action: {
                    print("Rent of the day pressed")
                    
                }) {
                    Image("photoPlaceholder").resizable().scaledToFit().frame(width: 150.0, height: 150.0)
                }
                Spacer()
            }
            
            Text("$XXX.XX").font(.system(size: 24)).padding(.leading, 10)
            Text("name").padding(.bottom).padding(.leading, 10)
            
        }
        .background(Color.white)
        
        
        
        
    }
}

struct EssentialView: View {
    
    @State var label: String = "Essential Name"
    @EnvironmentObject var homeModel: ProductViewModel
    
    
    var body: some View {
        // Top Essentials
        VStack(alignment: .leading) {
            
            List($homeModel.products) { product in
                HStack{
                    Text("\(product.name.wrappedValue) | \(product.category.wrappedValue ?? "")").font(.system(size: 20)).padding(.leading, 10).padding(.top, 10)
                    HomeHorizontalIconView(label: $label)
                }
            }
            
            
            
        }
        .background(Color.white)
        
    }
    
}

struct CategoriesView : View {
    
    @State var label: String = "Category Name"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories").font(.system(size: 20)).padding(.leading, 10).padding(.top, 10)
            
            HomeHorizontalIconView(label: $label)
            
        }
        .background(Color.white)
        
    }
}

struct HomeHorizontalIconView : View {
    
    @Binding var label: String
    let icons = ["1", "2", "3", "4"]
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                // TODO this needs to loop through data
                ForEach(icons, id: \.self) { icon in
                    VStack {
                        Button(action: {
                            print(label)
                            
                        }) {
                            Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                        Text(label).font(.system(size: 14))
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
