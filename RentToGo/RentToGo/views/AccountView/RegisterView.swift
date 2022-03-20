//
//  RegisterView.swift
//  RentToGo
//
//  Created by Md Nazrul Islam on 2022-03-20.
//

import SwiftUI

struct RegiterView: View {
    
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State private var userName: String = ""
    @State private var email: String = ""
    
        @State private var password: String = ""
       @State private var repassword: String = ""
    @State var goNextScreen = false
    
    var body: some View {
        ScrollView{
        HStack() {
                  VStack(alignment: .leading) {
                     Image("register")
                     
                     // Spacer()
                  }.frame(width: .infinity, height: 50, alignment: .center)
                 Spacer()
              }.background(themeColor)  .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        
        
        VStack(alignment: .center) {
            
            Image("rentSign")
            
        }
        Spacer()
            VStack {
              
                TextField("User Name", text: $userName)
                            .padding(.horizontal, 30).padding(.top, 20)
                        Divider()
                            .padding(.horizontal, 30)
                
                TextField("Email", text: $email)
                            .padding(.horizontal, 30).padding(.top, 20)
                        Divider()
                            .padding(.horizontal, 30)
                        TextField("Password", text: $password)
                            .padding(.horizontal, 30).padding(.top, 20)
                        Divider()
                            .padding(.horizontal, 30)
                TextField("Re Enter Password", text: $repassword)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                        Spacer()
                
            
                
                    }
        
        Spacer()
            
            Button {
                
                goNextScreen = true
            } label: {
                               ZStack {
                                   Image("registerBtn").frame(maxWidth: .infinity, maxHeight: 50)
                                       .padding(.bottom, 8)
                               }
            }.fullScreenCover(isPresented: $goNextScreen, content: {
                AccountDtlView()
            })
            .padding(.top)
            
            
            
        }
        
        
        
    }
}

struct RegiterView_Previews: PreviewProvider {
    static var previews: some View {
        RegiterView()
    }
}

