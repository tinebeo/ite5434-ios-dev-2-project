
//
//  AccountDtlView.swift
//  RentToGo
//
//  Created by Md Nazrul Islam on 2022-03-20.
//

import SwiftUI

struct AccountDtlView: View {
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State var goNextScreen = false
    @State var goLoginScreen = false
    var body: some View {
        ScrollView{
        HStack(alignment: .center, spacing: 50) {
            HStack(alignment: .center) {
                Image("account").padding()
                     // Spacer()
                  }.frame(width: .infinity, height: 50, alignment: .center)
            Spacer(minLength: 130)
            
            HStack(alignment: .center) {
                  
                Button {
                    
                    goLoginScreen = true
                } label: {
                                   ZStack {
                                       Image("logout").frame(maxWidth: .infinity, maxHeight: 50)
                                           .padding(.bottom, 8)
                                   }
                }.fullScreenCover(isPresented: $goLoginScreen, content: {
                    LoginView()
                })
                     
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
                                       Image("editAccount").frame(maxWidth: .infinity, maxHeight: 50)
                                           .padding(.bottom, 8)
                                   }
                }.fullScreenCover(isPresented: $goNextScreen, content: {
                    EditAccountView()
                })
               
                
            }
            
            VStack(){
                
                HStack{
                    Text("User Name    ").bold()
                    Text("xxxxxxxxx")
                    
                }.padding()
                
                HStack{
                     Text("Item Rented            ").bold()
                    Text("xxxxx")
                    
                }.padding()
                
                HStack{
                     Text("Item Posted For Rent        ").bold()
                    Text("xxxxxxxxxxxxx")
                    
                }
              
            }
            
            VStack(){
                
             
                
              
            }
            
        }
        
    }
}

struct AccountDtlView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDtlView()
    }
}
