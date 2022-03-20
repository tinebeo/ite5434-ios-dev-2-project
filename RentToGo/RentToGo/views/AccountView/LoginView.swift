//
//  LoginView.swift
//  RentToGo
//
//  Created by Md Nazrul Islam on 2022-03-20.
//

import SwiftUI

struct LoginView: View {
   
   
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State private var userName: String = ""
        @State private var password: String = ""
        let verticalPaddingForForm = 40.0
    @State var selectedTag: String?
   
    @State var goNextScreen = false
    var body: some View {
      
     
            ScrollView{
                ZStack {
                    Image("login")
                    HStack(alignment:.bottom) {
                    }
                    .padding(.leading, 0)
                    .frame(minWidth: 400, idealWidth: 400, maxWidth: 600, minHeight: 40)
                   
                    
                }
                .frame(width:.infinity,height: 50)
                 //   .border(Color.gray)
                    .cornerRadius(15)
                    .padding(10)
                    .background(themeColor)
      
            
            VStack(alignment: .center) {
                
                Image("rentSign")
                
            }
            Spacer()
            

      
                VStack {
                  
                    TextField("User Name", text: $userName)
                                .padding(.horizontal, 30).padding(.top, 20)
                            Divider()
                                .padding(.horizontal, 30)
                            TextField("Password", text: $password)
                                .padding(.horizontal, 30).padding(.top, 20)
                            Divider()
                                .padding(.horizontal, 30)
                            Spacer()
                    
                
                    
                        }
            
            Spacer()
            Button {
               
                           } label: {
                               ZStack {
                                   Image("loginBtn").frame(maxWidth: .infinity, maxHeight: 50)
                                       .padding(.bottom, 8)
                               }
                           }
                           .padding(.top)
               // navigateLink(to: RegiterView(), when: $goNextScreen)
            
            Button(action: {
                      
                goNextScreen = true
                self.selectedTag = "xx"
                   }, label: {
                       Image("createAccount")
                   })
            .fullScreenCover(isPresented: $goNextScreen, content: {
                                RegiterView()
                            })
                
        }
          
        }
      
        }
    





struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
