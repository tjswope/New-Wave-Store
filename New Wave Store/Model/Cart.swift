//
//  Cart.swift
//  New Wave Store Set 3
//
//  Created by Swope, Thomas on 12/1/22.
//

import Foundation

class Cart: ObservableObject{
    @Published var products: ProductList = ProductList(products: [])
    @Published var id: UUID = UUID()
    
    var total: Double {
        var t: Double = 0.0
        
        for p in products.products{
            t += p.price * Double(p.quantity)
        }
        
        return t
    }
    
    func addProduct(_ product: Product){
        if !products.products.contains(product){
            products.products += [product]
        } else {
            for p in products.products{
                if p == product{
                    p.quantity+=1
                }
            }
        }
        
        id = UUID()
    }
}
