//
//  LoginCredentials.swift
//  MDNAZRULISLAM_N01469625_A2
//
//  Created by Md Nazrul Islam on 2022-04-15.
//

import Foundation
import Combine

struct LoginCredentials{
    
    var email : String
    var password : String
    
    
}

extension LoginCredentials{
    
    static var new : LoginCredentials{
        
        LoginCredentials(email: "", password: "")
        
    }
}
