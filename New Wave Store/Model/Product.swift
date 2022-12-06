//
//  Product.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/18/22.
//

import Foundation

class Product: ObservableObject, Identifiable, Equatable{
    
    
    @Published var name: String
    @Published var description: String
    @Published var picture: String
    @Published var price: Double
    @Published var quantity: Int
    let id = UUID()
    
    init(name: String = "NW-PC", description: String = "New Wave's Best Computer", picture: String = "NW-PC", price: Double = 9999.99, quantity: Int = 100){
        self.name = name
        self.description = description
        self.picture = picture
        self.price = price
        self.quantity = quantity
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name
    }
}
