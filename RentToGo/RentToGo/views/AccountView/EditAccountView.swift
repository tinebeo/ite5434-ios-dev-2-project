//
//  EditAccountView.swift
//  RentToGo
//
//  Created by Md Nazrul Islam on 2022-03-20.
//

import SwiftUI

struct EditAccountView: View {
    @EnvironmentObject var sessionService : SessionServiceImp
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State var goNextScreen = false
   //
    @State private var userName: String = ""
    
    @State private var email: String = ""
    
        @State private var password: String = ""
       @State private var repassword: String = ""
    @State private var address: String = ""
    var body: some View {
        ScrollView{
        HStack() {
                  VStack(alignment: .leading) {
                     
                      Button {
                          
                          goNextScreen = true
                      } label: {
                                         ZStack {
                                             Image("editAccount").frame(maxWidth: .infinity, maxHeight: 50)
                                                 .padding(.bottom, 8)
                                         }
                      }.fullScreenCover(isPresented: $goNextScreen, content: {
                          AccountDtlView()
                      })
                      
                      
                     
                     // Spacer()
                  }.frame(width: .infinity, height: 50, alignment: .center)
                 Spacer()
              }.background(themeColor)  .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            VStack(alignment: .center) {
                
                Image("appLogo")
                
            }
                VStack(alignment: .center) {
                    Button {
                        
                        goNextScreen = true
                    } label: {
                                       ZStack {
                                           Image("uploadImage").frame(maxWidth: .infinity, maxHeight: 50)
                                               .padding(.bottom, 8)
                                       }
                    }/*.fullScreenCover(isPresented: $goNextScreen, content: {
                        EditAccountView()
                    })*/
                   
                    
                }
            
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
                
                TextField("Address", text: $address)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                
                
                
                       
                
            
                
                    }
        
            Spacer()
            Spacer()
            Button {
                
                goNextScreen = true
            } label: {
                               ZStack {
                                   Image("saveBtn").frame(maxWidth: .infinity, maxHeight: 50)
                                       .padding(.bottom, 8)
                               }
            }.fullScreenCover(isPresented: $goNextScreen, content: {
                AccountDtlView()
            })
            
            
            
            
        }
    }
}

struct EditAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountView()
    }
}

