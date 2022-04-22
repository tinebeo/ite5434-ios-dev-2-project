//
//  RegistrationViewModel.swift
//  MDNAZRULISLAM_N01469625_A2
//
//  Created by Md Nazrul Islam on 2022-04-15.
//

import Foundation
import Combine
import SwiftUI
import Firebase

enum RegistrationState{
    
    case successfull
    case failed(error: Error)
    case na
    
}

protocol RegistrationViewModel{
    func register()
    var hasError :Bool{get}
    var service: RegistrationService{get}
    var state: RegistrationState{get}
   
    var userDetails: RegistrationDetails{get}
    
   
   
    init(service:RegistrationService)
}

final class RegistarionViewModelImp: ObservableObject, RegistrationViewModel{
    
    @Published var hasError: Bool = false
    @Published var state: RegistrationState = .na
   
    private var subscriptions = Set<AnyCancellable>()
    
    var service: RegistrationService
    
   
    
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    func register() {
        service
            .Register(with: userDetails)
            .sink{
                [weak self] res in
              
                switch res{
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            }receiveValue: { [weak self] in
                self?.state = .successfull
                
            }.store(in: &subscriptions)
    }
    
}

private extension RegistarionViewModelImp{
    
    func setupErrorSubscriptions()
    {
        
        $state
            .map{ state -> Bool in
            switch state{
            case .successfull,
                    .na:
                return false
            case .failed:
                return true
                
            }
            
            
        }.assign(to: &$hasError)
        
        
    }
    
    
}
