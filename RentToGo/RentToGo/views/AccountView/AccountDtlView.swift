
//
//  AccountDtlView.swift
//  RentToGo
//
//  Created by Md Nazrul Islam on 2022-03-20.
//

import SwiftUI

struct AccountDtlView: View {
    @EnvironmentObject var sessionService : SessionServiceImp
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State var goNextScreen = false
    @State var goLoginScreen = false
    var body: some View {
       
        ScrollView{
           
            HStack(alignment: .center, spacing: 50) {
            HStack(alignment: .center) {
                Image("account").padding()
                   
            }
            Spacer(minLength: 130)
            
            HStack(alignment: .center) {
                  
                Button {
                    sessionService.logout()
                  
                } label: {
                                   ZStack {
                                       Image("logout").frame(maxWidth: .infinity, maxHeight: 50)
                                           .padding(.bottom, 8)
                                   }
                }
                     
            }.frame(width: .infinity, height: 50, alignment: .top)
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
            Spacer(minLength:40)
           
            VStack(alignment: .leading, spacing: 16){
                
                Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A" ) ")
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A" ) ")
                
             
              
            }
            
          
            
        }.padding(.leading)
        
    }
}

struct AccountDtlView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDtlView()
    }
}

/* ScrollView{
 HStack(alignment: .center) {
 HStack() {
     VStack(alignment: .leading) {
         Image("account").padding()
         
     }
     
 }
 Spacer(minLength: 140)
 HStack(){
     Button {
         sessionService.logout()
       
     } label: {
                        ZStack {
                            Image("logout").frame(maxWidth: .infinity, maxHeight: 50)
                                .padding(.bottom, 8)
                        }
     }
     
 }
 }.ignoresSafeArea().background(themeColor)

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
 
 VStack(alignment: .leading, spacing: 16){
     
     Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A" ) ")
     Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A" ) ")
     
  
   
 }
 

}*/
