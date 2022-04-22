//
//  SessionState.swift
//  
//
//  Created by Md Nazrul Islam on 2022-04-15.
//


import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum SessionState{
    
    case loggedIn
    case loggedOut
}

protocol SessionService{
    
    var state : SessionState { get }
    var userDetails : SessionUserDtl? {get}
    func logout()
}

final class SessionServiceImp: ObservableObject, SessionService {
 
    init()
    {
        
        setupFirebaseauthandaler()
        
    }
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDtl?
    
    private(set)  var handler : AuthStateDidChangeListenerHandle?
   
    
    
    func logout() {
        try? Auth.auth().signOut()
    }
    
    
  
}

private extension SessionServiceImp{
    
    func setupFirebaseauthandaler(){
       
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] res, user in
            guard let self = self else { return }
                self.state = user == nil ? .loggedOut : .loggedIn
                
                if let uid = user?.uid {
                    
                 self.handleRefresh(with: uid)
                }
              }
        
        
    }
   
    
    func handleRefresh(with uid: String){
        
        
        Database.database()
            .reference()
            .child("Users")
            .child(uid)
            .observe(.value){ [weak self] snapshot in
                
                guard let self = self,
                      let value = snapshot.value as? NSDictionary,
                      let firstName = value[RegistrationKey.firstName.rawValue] as? String,
                      let lastName = value[RegistrationKey.lastName.rawValue] as? String else {
                      return
                    
                }
                
                DispatchQueue.main.async {
                    self.userDetails = SessionUserDtl(firstName: firstName, lastName: lastName)
                }
            }
        
        
        
        
        
    }
    
    
    
}
