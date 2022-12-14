//
//  ContentView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/17/22.
//

import SwiftUI

enum ViewState{
    case list, detail
}


struct ContentView: View {
    @EnvironmentObject var products: ProductList
    @State var viewState: ViewState = .list
    @State var index: Int = 0
    
    var body: some View {
        
        TabView{
            if viewState == .list{
                HomeView(viewState: $viewState, index: $index)
                    .tabItem {
                        Image(systemName: "house")
                        Text("home")
                    }
            } else {
                ProductDetailView(product: $products.products[index], viewState: $viewState)
                    .tabItem {
                    Image(systemName: "house")
                    Text("home")
                }
                    
            }
            
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("cart")
                }
        }.accentColor(Color.highlight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductList())
    }
}
