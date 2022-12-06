//
//  HomeView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/18/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        VStack{
            ScrollView{
//                ForEach(cart.products.products.indices){index in
//                    CartItemView(product: $cart.products.products[index])
//                }
                ForEach($cart.products.products){ product in
                    CartItemView(product: product)
                }
            }
            HStack{

                Text("Total")
                    .font(Constants.textFont.bold())
                    .padding([.trailing, .leading])

                Spacer()
                
                Text(String(format: "$ %.2f", cart.total))
                    .font(Constants.textFont)
                    .foregroundColor(Color.highlight)
                
            }
        }.padding()
            .background(Color.gray.opacity(0.1))
    }
}

struct Cartiew_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(Cart())
    }
}
