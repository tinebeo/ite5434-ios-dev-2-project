//
//  RegistrationDetails.swift
//  MDNAZRULISLAM_N01469625_A2
//
//  Created by Md Nazrul Islam on 2022-04-15.
//

import Foundation

struct RegistrationDetails{
    var email : String
    var password : String
    var firstName : String
    var lastName : String
    
}
extension RegistrationDetails{
    
    static var new: RegistrationDetails{
        RegistrationDetails( email: "", password: "", firstName: "", lastName: "" )
          
     }
    
}
