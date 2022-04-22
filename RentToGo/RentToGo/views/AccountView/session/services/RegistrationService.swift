//
//  RegistrationService.swift
//  
//
//  Created by Md Nazrul Islam on 2022-04-15.
//
import Combine
import Foundation
import Firebase
import FirebaseDatabase



enum RegistrationKey:String{
    
    case firstName
    case lastName
    
}

protocol RegistrationService{
    
    func Register(with details: RegistrationDetails)->AnyPublisher<Void, Error>
}

final class RegistrationServiceImp:RegistrationService{
  
    func Register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred{
            
            Future{ Promise in
                
                Auth.auth().createUser(withEmail: details.email, password: details.password){ res, error in
                    
                    if let err = error{
                        
                        Promise(.failure(err))
                        
                    }else{
                        
                        if let uid = res?.user.uid{
                            
                            let values = [RegistrationKey.firstName.rawValue : details.firstName,
                                          RegistrationKey.lastName.rawValue : details.lastName] as [String : Any]
                        
                        
                            Database.database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .updateChildValues(values){ error, ref in
                                    if let err = error{
                                        
                                        Promise(.failure(err))
                                    }else{
                                        Promise(.success(()))
                                        
                                    }
                                         
                                    
                                    
                                }
                            
                        }else{
                            
                            Promise(.failure(NSError(domain: "User Id Invelid", code: 0, userInfo: nil)))
                            
                            
                        }
                        
                    }
                    
                }
                
                
            }
            
            
        }.receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
    
  
    
    
    
}
