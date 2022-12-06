//
//  ProductDetailView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/28/22.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var product: Product
    @Binding var viewState: ViewState
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        VStack(alignment: .leading){
            
            Button{
                self.viewState = .list
            } label: {
                Text("<< back")
                    .font(Constants.textFont)
                    .foregroundColor(Color.highlight)
                    .padding([.trailing, .leading, .bottom], 5)
            }
            
            
            Image(product.picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
                .padding(20)
            
            Text(product.name)
                .font(Constants.textFont.bold())
                .padding([.trailing, .leading, .bottom], 5)
            
            Text(product.description)
                .font(Constants.textFont)
                .padding([.trailing, .leading, .bottom], 5)
            
            Text(String(format: "$%.2f", product.price))
                .font(Constants.textFont)
                .foregroundColor(Color.highlight)
                .padding([.trailing, .leading, .bottom], 5)
            
            Text("Quantity Available: \(product.quantity)")
                .font(Constants.textFont)
                .padding([.trailing, .leading, .bottom], 5)
            Spacer()
            
            Button {
                cart.addProduct(Product(name: product.name, description: product.description, picture: product.picture, price: product.price, quantity: 1))
                
                print(cart.products.products.count)
            } label: {
                Text("Add to Cart")
                    .font(Constants.textFont)
                    .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
                    .padding(10)
                    .foregroundColor(.black)
                    .background(Color.highlight)
                    .cornerRadius(10)
            }
        }.padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Binding.constant(Product()), viewState: Binding.constant(ViewState.list))
            .environmentObject(Cart())
    }
}
