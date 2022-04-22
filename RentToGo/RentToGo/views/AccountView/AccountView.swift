//
//  AccountView.swift
//  RentToGo
//
//  Created by Christine Ebeo on 2022-03-18.
//

import SwiftUI

struct AccountView: View {
   
    @EnvironmentObject var sessionService : SessionServiceImp
    var body: some View {
        AccountDtlView().environmentObject(sessionService)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
