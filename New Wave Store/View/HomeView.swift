//
//  HomeView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/18/22.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var products: ProductList
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    @Binding var index: Int
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach($products.products.indices){ index in
                    ProductListView(product: $products.products[index])
                        .padding([.bottom],5)
                        .onTapGesture {
                            self.index = index
                            self.viewState = .detail
                        }
                }
            }
            
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewState: Binding.constant(ViewState.list), index: Binding.constant(0))
            .environmentObject(ProductList())
    }
}
