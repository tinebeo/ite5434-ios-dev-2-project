//
//  RegisterView.swift
//  RentToGo
//
//  Created by Md Nazrul Islam on 2022-03-20.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegiterView: View {
    @StateObject private var vm = RegistarionViewModelImp(
        service: RegistrationServiceImp()
    )
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State private var userName: String = ""
    @State private var email: String = ""
    
        @State private var password: String = ""
       @State private var repassword: String = ""
    @State var goNextScreen = false
    @State var goLoginScreen = false
    
    var body: some View {
        ScrollView{
         
            ZStack {
                    Image("register")
                    HStack(alignment:.bottom) {
                    }
                    .padding(.leading, 0)
                    .frame(minWidth: 400, idealWidth: 400, maxWidth: 600, minHeight: 40)
                   
                    
                }
                .frame(minWidth: 300, idealWidth: 400, maxWidth: 600, minHeight: 50, idealHeight: 50, maxHeight: 100, alignment: .top)
                 //   .border(Color.gray)
                    .cornerRadius(15)
                    .padding(10)
                    .background(themeColor).ignoresSafeArea()
      
            
        
        
        VStack(alignment: .center) {
            
            Image("rentSign")
            
        }
        Spacer()
            VStack {
              
                TextField("First Name", text: $vm.userDetails.firstName)
                            .padding(.horizontal, 30).padding(.top, 20)
                        Divider()
                            .padding(.horizontal, 30)
                
                TextField("Last Name", text: $vm.userDetails.lastName)
                            .padding(.horizontal, 30).padding(.top, 20)
                        Divider()
                            .padding(.horizontal, 30)
                
                TextField("Email", text: $vm.userDetails.email)
                            .padding(.horizontal, 30).padding(.top, 30)
                        Divider()
                            .padding(.horizontal, 30)
                SecureField("Password(7)", text: $vm.userDetails.password)
                            .padding(.horizontal, 30).padding(.top, 20)
                        
                        Divider()
                            .padding(.horizontal, 30)
                SecureField("Re Enter Password(7)", text: $repassword)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                      
                
            
                
                    }
        
        Spacer()
            
            Button {
                
                vm.register()
            } label: {
                               ZStack {
                                   Image("registerBtn").frame(maxWidth: .infinity, maxHeight: 50)
                                       .padding(.bottom, 8)
                               }
            }.fullScreenCover(isPresented: $goNextScreen, content: {
                AccountDtlView()
            })
            .padding(.top)
            
            Button(action: {
                      
                goLoginScreen = true
              
                   }, label: {
                       Image("login")
                   })
            .fullScreenCover(isPresented: $goLoginScreen, content: {
                                LoginView()
                            })
            
            
            
        }.alert(isPresented: $vm.hasError,content: {
            if case .failed(let error) = vm.state{
                return Alert(
                title: Text("Error"),
                message: Text(error.localizedDescription)
                )
            }else{
                return Alert(
                title: Text("Error"),
                message: Text("Something went wrong")
                )
                
            }
                
            }
            
        )
        
        
        
    }
}

struct RegiterView_Previews: PreviewProvider {
    static var previews: some View {
        RegiterView()
    }
}

