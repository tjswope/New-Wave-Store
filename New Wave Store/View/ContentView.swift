//
//  ContentView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/17/22.
//

import SwiftUI

enum ViewState{
    case list, detail, authentication, login, signUp, forgotPassword
}


struct ContentView: View {
    @EnvironmentObject var products: ProductList
    @EnvironmentObject var userInfo: UserInfo
    
    @State var viewState: ViewState = .authentication
    @State var index: Int = 0
    
    var body: some View {
        
        if viewState == .authentication && !userInfo.loggedIn{
            AuthenticationView(viewState: $viewState)
        } else if viewState == .login && !userInfo.loggedIn{
            LoginView(viewState: $viewState)
        } else if viewState == .signUp && !userInfo.loggedIn{
            SignupView(viewState: $viewState)
        } else if viewState == .forgotPassword && !userInfo.loggedIn{
            ForgotPassword(viewState: $viewState)
        } else {
            TabView{
                if viewState == .detail{
                    ProductDetailView(product: $products.products[index], viewState: $viewState)
                        .tabItem {
                            Image(systemName: "house")
                            Text("home")
                        }
                } else {
                    HomeView(viewState: $viewState, index: $index)
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
                
                SettingsView(viewState: $viewState)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("settings")
                    }
            }.accentColor(Color.highlight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductList())
    }
}
