//
//  History.swift
//  RentToGo
//
//  Created by Tim Baklanov on 2022-04-22.
//

import Foundation

class History: ObservableObject {

    @Published private(set) var items: Set<Product> = Set<Product>()
    
    func addToTheHistory(_ item: Product) {
        items.insert(item)
    }

}
