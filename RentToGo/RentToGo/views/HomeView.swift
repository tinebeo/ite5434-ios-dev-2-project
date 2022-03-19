//
//  HomeView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct HomeView: View {
    
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @Binding var searchText: String
    
    var body: some View {
        
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
                .background(themeColor)
            
            VStack(alignment: .leading) {
                
                // Rent of the Day
                Text("Rent of the Day").padding(.bottom).font(.system(size: 20)).padding(.leading, 10)
                
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
                Text("Item name").padding(.bottom).padding(.leading, 10)
                
                Rectangle()
                    .fill(themeColor)
                    .frame(height: 10)
                    .edgesIgnoringSafeArea(.horizontal)
                
                // Top Essentials
                Text("Top Essentials").font(.system(size: 20)).padding(.leading, 10)
                
                ScrollView(.horizontal) {
                    HStack {
                        // TODO this needs to loop through data
                        VStack {
                            
                            Button(action: {
                                print("Essential pressed")
                                
                            }) {
                                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            }
                            
                            Text("Essential Name").font(.system(size: 14))
                        }
                        VStack {
                            Button(action: {
                                print("Essential pressed")
                                
                            }) {
                                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            }
                            
                            Text("Essential Name").font(.system(size: 14))
                        }
                        VStack {
                            Button(action: {
                                print("Essential pressed")
                                
                            }) {
                                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            }
                            
                            Text("Essential Name").font(.system(size: 14))
                        }
                        
                        
                    }.padding(.leading, 10)
                }
                
                Rectangle()
                    .fill(themeColor)
                    .frame(height: 10)
                    .edgesIgnoringSafeArea(.horizontal)
                
                // Categories
                Text("Categories").font(.system(size: 20)).padding(.leading, 10)
                ScrollView(.horizontal) {
                    HStack {
                        // TODO this needs to loop through data
                        VStack {
                            Button(action: {
                                print("Category pressed")
                                
                            }) {
                                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            }
                            Text("Category Name").font(.system(size: 14))
                        }
                        VStack {
                            Button(action: {
                                print("Category pressed")
                                
                            }) {
                                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            }
                            Text("Category Name").font(.system(size: 14))
                        }
                        VStack {
                            Button(action: {
                                print("Category pressed")
                                
                            }) {
                                Image("photoPlaceholder").resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            }
                            Text("Category Name").font(.system(size: 14))
                        }
                        
                    }.padding(.leading, 10)
                }
                
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(searchText: .constant(""))
    }
}
