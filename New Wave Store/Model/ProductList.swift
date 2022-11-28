//
//  ProductList.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/18/22.
//

import Foundation

class ProductList: ObservableObject{
    @Published var products: [Product]
    
    init(){
        products = [Product(), Product(name: "nwPhone", description: "", picture: "wPhone", price: 1999.50, quantity: 3000), Product(name: "wPen", description: "", picture: "wPen", price: 4999.99, quantity: 10000), Product(name: "Software", description: "", picture: "software", price: 450.50, quantity: 250)]
    }
}
