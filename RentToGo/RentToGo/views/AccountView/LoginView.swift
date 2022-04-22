import SwiftUI
import Firebase


struct LoginView: View {
   
    @StateObject private var vm = LoginViewModelImp(service: LoginServiceImp())
    let themeColor : Color = Color(UIColor(red: 0.79, green: 0.96, blue: 0.96, alpha: 1.00))
    @State private var userName: String = ""
    @State private var email: String = ""
        @State private var password: String = ""
        let verticalPaddingForForm = 40.0
    @State var selectedTag: String?
   
    @State var goNextScreen = false
    var body: some View {
       
        ScrollView{
            Spacer()
            Spacer()
            Spacer()
            ZStack {
                Spacer()
                    Image("login")
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
                  
                    TextField("User Name", text: $vm.credentials.email)
                                .padding(.horizontal, 30).padding(.top, 20)
                            Divider()
                                .padding(.horizontal, 30)
                    
                    SecureField("Password", text: $vm.credentials.password)
                                .padding(.horizontal, 30).padding(.top, 20)
                            Divider()
                                .padding(.horizontal, 30)
                            Spacer()
                    
                
                    
                        }
            
            Spacer()
          
            
            Button {
                vm.login()
                           } label: {
                               ZStack {
                                   Image("loginBtn").frame(maxWidth: .infinity, maxHeight: 50)
                                       .padding(.bottom, 8)
                               }
                           }
                           .padding(.top)
                         
               
            
            Button(action: {
                      
                goNextScreen = true
        
                   }, label: {
                       Image("createAccount")
                   })
            .fullScreenCover(isPresented: $goNextScreen, content: {
                                RegiterView()
                            })
                
        }.ignoresSafeArea()
            .alert(isPresented: $vm.hasError,content: {
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
    





struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
