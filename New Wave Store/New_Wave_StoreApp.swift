//
//  New_Wave_StoreApp.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/17/22.
//

import SwiftUI

@main
struct New_Wave_StoreApp: App {
    @StateObject var products: ProductList = ProductList()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(products)
        }
    }
}
